import 'package:advanced_ecommerce/core/errors/failure.dart';
import 'package:advanced_ecommerce/core/services/supabase_auth_service.dart';
import 'package:advanced_ecommerce/features/auth/data/models/user_model.dart';
import 'package:advanced_ecommerce/features/auth/domain/entities/user_entity.dart';
import 'package:advanced_ecommerce/features/auth/domain/repos/auth_repo.dart';
import 'package:dartz/dartz.dart';

class AuthRepoImpl implements AuthRepo {
  final SupabaseAuthService _supabaseAuthService;

  AuthRepoImpl(this._supabaseAuthService);

  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String fullName,
    required String phoneNumber,
  }) async {
    try {
      final user = await _supabaseAuthService.registerWithEmailAndPassword(
        email: email,
        password: password,
        fullName: fullName,
        phoneNumber: phoneNumber,
      );

      final userModel = UserModel.fromSupabaseUser(
        supabaseUser: user!,
        phoneNumber: phoneNumber,
        userName: fullName,
      );

      return Right(userModel);
    } catch (error) {
      return Left(Failure.fromException(error));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final user = await _supabaseAuthService.logInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final userModel = UserModel.fromSupabaseUser(
        supabaseUser: user!,
        phoneNumber: user.phone ?? '',
        userName: user.userMetadata?['full_name'] ?? email.split('@').first,
      );

      return Right(userModel);
    } catch (error) {
      print(error.toString());
      return Left(Failure.fromException(error));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> loginWithGoogle() async {
    try {
      final user = await _supabaseAuthService.signInWithGoogle();

      final userModel = UserModel.fromSupabaseUser(
        supabaseUser: user!,
        phoneNumber: user.phone ?? '',
        userName: user.userMetadata?['name'] ??
            user.userMetadata?['full_name'] ??
            user.email?.split('@').first ??
            'Google User',
      );

      return Right(userModel);
    } catch (error) {
      return Left(Failure.fromException(error));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> loginWithFacebook() async {
    try {
      final user = await _supabaseAuthService.signInWithFacebook();

      final userModel = UserModel.fromSupabaseUser(
        supabaseUser: user!,
        phoneNumber: user.phone ?? '',
        userName: user.userMetadata?['name'] ??
            user.userMetadata?['full_name'] ??
            user.email?.split('@').first ??
            'Facebook User',
      );

      return Right(userModel);
    } catch (error) {
      return Left(Failure.fromException(error));
    }
  }
}
