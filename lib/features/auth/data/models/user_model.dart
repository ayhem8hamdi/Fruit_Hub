import 'package:advanced_ecommerce/features/auth/domain/entities/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.email,
    required super.phoneNumber,
    required super.userName,
    required super.uId,
  });

  factory UserModel.fromFirebaseUser({
    required User firebaseUser,
    required String phoneNumber,
    required String userName,
  }) {
    return UserModel(
      email: firebaseUser.email ?? '',
      phoneNumber: phoneNumber,
      userName: userName,
      uId: firebaseUser.uid,
    );
  }
}