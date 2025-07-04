import 'package:advanced_ecommerce/core/errors/failure.dart';
import 'package:advanced_ecommerce/features/auth/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      {required String email,
      required String password,
      required String fullName,
      required String phoneNumber});
  Future<Either<Failure, UserEntity>> loginWithEmailAndPassword({
    required String email,
    required String password,
  });
}
