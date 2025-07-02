import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class Failure {
  final String message;
  final String code;

  Failure({required this.message, required this.code});

  factory Failure.fromException(Object error) {
    if (error is FirebaseAuthException) {
      return FirebaseAuthFailure.fromFirebaseAuthException(error);
    } else if (error is PlatformException) {
      return PlatformFailure(
        message: error.message ?? 'Platform error',
        code: 'PLATFORM_ERROR',
      );
    } else if (error is FormatException) {
      return ParsingFailure(
        message: 'Data format error',
        code: 'PARSING_ERROR',
      );
    } else if (error is AuthenticationException) {
      return AuthenticationFailure(
        message: error.message,
        code: 'AUTH_ERROR',
      );
    } else if (error is DatabaseException) {
      return DatabaseFailure(
        message: error.message,
        code: 'DB_ERROR',
      );
    } else if (error is Exception) {
      return UnknownFailure(
        message: error.toString(),
        code: 'UNKNOWN_EXCEPTION_ERROR',
      );
    } else {
      return UnknownFailure(
        message: 'An unexpected error occurred: ${error.toString()}',
        code: 'UNKNOWN_ERROR',
      );
    }
  }
}

// Specific failure implementations

class FirebaseAuthFailure extends Failure {
  FirebaseAuthFailure({required super.message, required super.code});

  factory FirebaseAuthFailure.fromFirebaseAuthException(FirebaseAuthException e) {
    switch (e.code) {
      case 'invalid-email':
        return FirebaseAuthFailure(
          message: 'The email address is badly formatted.',
          code: e.code,
        );
      case 'user-disabled':
        return FirebaseAuthFailure(
          message: 'This user has been disabled.',
          code: e.code,
        );
      case 'user-not-found':
        return FirebaseAuthFailure(
          message: 'No user found for that email.',
          code: e.code,
        );
      case 'wrong-password':
        return FirebaseAuthFailure(
          message: 'Wrong password provided.',
          code: e.code,
        );
      case 'email-already-in-use':
        return FirebaseAuthFailure(
          message: 'Email is already in use.',
          code: e.code,
        );
      case 'operation-not-allowed':
        return FirebaseAuthFailure(
          message: 'Operation not allowed.',
          code: e.code,
        );
      case 'weak-password':
        return FirebaseAuthFailure(
          message: 'The password is too weak.',
          code: e.code,
        );
      case 'too-many-requests':
        return FirebaseAuthFailure(
          message: 'Too many requests. Try again later.',
          code: e.code,
        );
      default:
        return FirebaseAuthFailure(
          message: e.message ?? 'Authentication error occurred.',
          code: e.code,
        );
    }
  }
}

class AuthenticationFailure extends Failure {
  AuthenticationFailure({required super.message, required super.code});
}

class DatabaseFailure extends Failure {
  DatabaseFailure({required super.message, required super.code});
}

class ParsingFailure extends Failure {
  ParsingFailure({required super.message, required super.code});
}

class PlatformFailure extends Failure {
  PlatformFailure({required super.message, required super.code});
}

class UnknownFailure extends Failure {
  UnknownFailure({required super.message, required super.code});
}

// Custom exception classes (if you use them in your app)
class AuthenticationException implements Exception {
  final String message;
  AuthenticationException(this.message);
}

class DatabaseException implements Exception {
  final String message;
  DatabaseException(this.message);
}
