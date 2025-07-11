import 'package:advanced_ecommerce/features/auth/domain/entities/user_entity.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.email,
    required super.phoneNumber,
    required super.userName,
    required super.uId,
  });

  factory UserModel.fromSupabaseUser({
    required User supabaseUser,
    String? phoneNumber,
    String? userName,
  }) {
    return UserModel(
      email: supabaseUser.email ?? '',
      phoneNumber: phoneNumber ?? '',
      userName: userName ??
          supabaseUser.userMetadata?['name'] ??
          supabaseUser.email?.split('@').first ??
          '',
      uId: supabaseUser.id,
    );
  }
}
