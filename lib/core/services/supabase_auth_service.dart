import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseAuthService {
  final SupabaseClient _client;
  SupabaseAuthService(this._client);

  /// Register a new user with email and password
  Future<User?> registerWithEmailAndPassword({
    required String email,
    required String fullName,
    required String password,
    required String phoneNumber,
  }) async {
    final formattedPhone = _formatPhoneNumber(phoneNumber);

    final response = await _client.auth.signUp(
      email: email,
      password: password,
      data: {
        'full_name': fullName,
        'phone': formattedPhone,
      },
    );

    if (response.user != null) {
      await _createUserProfile(
        userId: response.user!.id,
        email: email,
        fullName: fullName,
        phone: formattedPhone,
        authProvider: 'email',
      );
    }

    return response.user;
  }

  /// Sign in with email and password
  Future<User?> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final response = await _client.auth.signInWithPassword(
      email: email,
      password: password,
    );
    return response.user;
  }

  /// Sign in with Google OAuth
  Future<User?> signInWithGoogle() async {
    await _client.auth.signInWithOAuth(
      OAuthProvider.google,
      redirectTo: kIsWeb ? null : 'io.supabase.flutter://login-callback/',
    );

    // After OAuth flow completes, update/create user profile
    final user = _client.auth.currentUser;
    if (user != null) {
      await _createOrUpdateUserProfile(
        userId: user.id,
        email: user.email,
        fullName:
            user.userMetadata?['full_name'] ?? user.email?.split('@').first,
        authProvider: 'google',
      );
    }

    return user;
  }

  /// Sign in with Facebook OAuth
  Future<User?> signInWithFacebook() async {
    await _client.auth.signInWithOAuth(
      OAuthProvider.facebook,
      redirectTo: kIsWeb ? null : 'io.supabase.flutter://login-callback/',
    );

    // After OAuth flow completes, update/create user profile
    final user = _client.auth.currentUser;
    if (user != null) {
      await _createOrUpdateUserProfile(
        userId: user.id,
        email: user.email,
        fullName:
            user.userMetadata?['full_name'] ?? user.email?.split('@').first,
        authProvider: 'facebook',
      );
    }

    return user;
  }

  /// Creates a new user profile in the 'profiles' table
  Future<void> _createUserProfile({
    required String userId,
    required String email,
    required String fullName,
    required String phone,
    required String authProvider,
    String? avatarUrl,
  }) async {
    await _client.from('profiles').insert({
      'id': userId,
      'email': email,
      'full_name': fullName,
      'phone': phone,
      'auth_provider': authProvider,
      'avatar_url': avatarUrl,
      'created_at': DateTime.now().toIso8601String(),
    });
  }

  /// Creates or updates a user profile
  Future<void> _createOrUpdateUserProfile({
    required String userId,
    String? email,
    String? fullName,
    String? phone,
    String? authProvider,
    String? avatarUrl,
  }) async {
    final updateData = {
      if (email != null) 'email': email,
      if (fullName != null) 'full_name': fullName,
      if (phone != null) 'phone': phone,
      if (authProvider != null) 'auth_provider': authProvider,
      if (avatarUrl != null) 'avatar_url': avatarUrl,
      'updated_at': DateTime.now().toIso8601String(),
    };

    await _client.from('profiles').upsert({'id': userId, ...updateData});
  }

  /// Format phone number to international standard
  String _formatPhoneNumber(String phoneNumber) {
    final digitsOnly = phoneNumber.replaceAll(RegExp(r'[^\d]'), '');
    return '+216$digitsOnly';
  }
}
