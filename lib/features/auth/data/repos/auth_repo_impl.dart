import 'package:advanced_ecommerce/core/errors/failure.dart';
import 'package:advanced_ecommerce/core/services/firebase_auth_service.dart';
import 'package:advanced_ecommerce/features/auth/data/models/user_model.dart';
import 'package:advanced_ecommerce/features/auth/domain/entities/user_entity.dart';
import 'package:advanced_ecommerce/features/auth/domain/repos/auth_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepoImpl implements AuthRepo {
  final FireBaseAuthService fireBaseAuthService;

  AuthRepoImpl(this.fireBaseAuthService);

  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String fullName,
    required String phoneNumber,
  }) async {
    try {
      final User firebaseUser = await fireBaseAuthService.registerUser(
        email: email,
        password: password,
        fullName: fullName,
        phoneNumber: phoneNumber,
      );

      final UserModel userModel = UserModel.fromFirebaseUser(
        firebaseUser: firebaseUser,
        phoneNumber: phoneNumber,
        userName: fullName,
      );

      return Right(userModel);
    } catch (error) {
      final failure = Failure.fromException(error);
      return Left(failure);
    }
  }

  @override
  Future<Either<Failure, UserEntity>> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final User firebaseUser = await fireBaseAuthService.loginUser(
        email: email,
        password: password,
      );

      final UserModel userModel = UserModel.fromFirebaseUser(
        firebaseUser: firebaseUser,
        phoneNumber: firebaseUser.phoneNumber ?? '',
        userName: firebaseUser.displayName ?? '',
      );

      return Right(userModel);
    } catch (error) {
      final failure = Failure.fromException(error);
      return Left(failure);
    }
  }

  @override
  Future<Either<Failure, UserEntity>> loginWithGoogle() async {
    try {
      final user = await fireBaseAuthService.signInWithGoogle();

      final UserModel userModel = UserModel.fromFirebaseUser(
        firebaseUser: user!,
        phoneNumber: user.phoneNumber ?? '',
        userName: user.displayName ?? 'Google User',
      );

      return Right(userModel);
    } catch (error) {
      final failure = Failure.fromException(error);
      return Left(failure);
    }
  }
}
