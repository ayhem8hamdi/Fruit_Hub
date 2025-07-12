import 'dart:developer';

import 'package:advanced_ecommerce/core/errors/failure.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:google_sign_in/google_sign_in.dart';
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
    try {
      final response = await _client.auth.signInWithPassword(
        email: email,
        password: password,
      );
      return response.user;
    } on AuthException catch (e) {
      // Handle specific auth errors
      if (e.message.contains('Invalid login credentials')) {
        throw AuthenticationException(
            'البريد الإلكتروني أو كلمة المرور غير صحيحة');
      } else if (e.message.contains('Email not confirmed')) {
        throw AuthenticationException(
            'لم يتم تأكيد البريد الإلكتروني بعد، يرجى التحقق من بريدك الوارد');
      }
      throw AuthenticationException('حدث خطأ أثناء تسجيل الدخول: ${e.message}');
    } catch (e) {
      throw AuthenticationException('حدث خطأ غير متوقع أثناء تسجيل الدخول');
    }
  }

  Future<User?> signInWithGoogle() async {
    if (kIsWeb) {
      // Web platform: use Supabase OAuth flow
      try {
        log('starting');
        await _client.auth.signInWithOAuth(
          OAuthProvider.google,
        );
        log('done');
        final user = _client.auth.currentUser;
        log('filling data');
        if (user != null) {
          await _createOrUpdateUserProfile(
            userId: user.id,
            email: user.email,
            fullName:
                user.userMetadata?['full_name'] ?? user.email?.split('@').first,
            authProvider: 'google',
          );
        }
        log('created user');
        return user;
      } catch (e) {
        throw Exception('Web Google sign-in failed: $e');
      }
    } else {
      // Mobile platform: use GoogleSignIn and sign in with ID token
      return await _signInWithGoogleMobile();
    }
  }

  Future<User?> _signInWithGoogleMobile() async {
    const webClientId =
        '33905260853-ano017dnrv1grbm65hpa4sf8tkjdubpl.apps.googleusercontent.com';
    const iosClientId =
        '33905260853-3bhcgcgvcdls2ooqno12coutrca0bqnv.apps.googleusercontent.com';

    final GoogleSignIn googleSignIn = GoogleSignIn(
      clientId: iosClientId,
      serverClientId: webClientId,
    );

    try {
      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        throw Exception('User cancelled Google Sign-In.');
      }

      final googleAuth = await googleUser.authentication;
      final accessToken = googleAuth.accessToken;
      final idToken = googleAuth.idToken;

      if (accessToken == null || idToken == null) {
        throw Exception('Missing Google auth tokens.');
      }

      final response = await _client.auth.signInWithIdToken(
        provider: OAuthProvider.google,
        idToken: idToken,
        accessToken: accessToken,
      );

      final user = response.user;

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
    } catch (e) {
      throw Exception('Mobile Google sign-in failed: $e');
    }
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
    };

    await _client.from('profiles').upsert({'id': userId, ...updateData});
  }

  /// Format phone number to international standard
  String _formatPhoneNumber(String phoneNumber) {
    final digitsOnly = phoneNumber.replaceAll(RegExp(r'[^\d]'), '');
    return '+216$digitsOnly';
  }
}
