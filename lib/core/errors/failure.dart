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
        message: error.message ?? 'حدث خطأ في النظام الأساسي.',
        code: 'PLATFORM_ERROR',
      );
    } else if (error is FormatException) {
      return ParsingFailure(
        message: 'حدث خطأ في تنسيق البيانات.',
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
        message: 'حدث استثناء غير متوقع: ${error.toString()}',
        code: 'UNKNOWN_EXCEPTION_ERROR',
      );
    } else {
      return UnknownFailure(
        message: 'حدث خطأ غير متوقع: ${error.toString()}',
        code: 'UNKNOWN_ERROR',
      );
    }
  }
}

class FirebaseAuthFailure extends Failure {
  FirebaseAuthFailure({required super.message, required super.code});

  factory FirebaseAuthFailure.fromFirebaseAuthException(
      FirebaseAuthException e) {
    switch (e.code) {
      case 'invalid-email':
        return FirebaseAuthFailure(
          message: 'عنوان البريد الإلكتروني غير صالح.',
          code: e.code,
        );
      case 'user-disabled':
        return FirebaseAuthFailure(
          message: 'تم تعطيل هذا المستخدم.',
          code: e.code,
        );
      case 'user-not-found':
        return FirebaseAuthFailure(
          message: 'لم يتم العثور على مستخدم بهذا البريد الإلكتروني.',
          code: e.code,
        );
      case 'wrong-password':
        return FirebaseAuthFailure(
          message: 'كلمة المرور غير صحيحة.',
          code: e.code,
        );
      case 'email-already-in-use':
        return FirebaseAuthFailure(
          message: 'البريد الإلكتروني مستخدم بالفعل.',
          code: e.code,
        );
      case 'operation-not-allowed':
        return FirebaseAuthFailure(
          message: 'هذه العملية غير مسموح بها.',
          code: e.code,
        );
      case 'weak-password':
        return FirebaseAuthFailure(
          message: 'كلمة المرور ضعيفة جداً.',
          code: e.code,
        );
      case 'too-many-requests':
        return FirebaseAuthFailure(
          message: 'طلبات كثيرة جداً. حاول مرة أخرى لاحقاً.',
          code: e.code,
        );
      case 'network-request-failed':
        return FirebaseAuthFailure(
          message: 'فشل الاتصال بالشبكة. تحقق من اتصال الإنترنت.',
          code: e.code,
        );
      case 'invalid-credential':
        return FirebaseAuthFailure(
          message: 'بيانات الاعتماد غير صالحة.',
          code: e.code,
        );
      case 'invalid-verification-code':
        return FirebaseAuthFailure(
          message: 'رمز التحقق غير صحيح.',
          code: e.code,
        );
      case 'invalid-verification-id':
        return FirebaseAuthFailure(
          message: 'رمز التحقق غير صالح.',
          code: e.code,
        );
      case 'session-expired':
        return FirebaseAuthFailure(
          message: 'انتهت صلاحية الجلسة. الرجاء المحاولة مرة أخرى.',
          code: e.code,
        );
      case 'account-exists-with-different-credential':
        return FirebaseAuthFailure(
          message: 'يوجد حساب بالفعل باستخدام بيانات اعتماد مختلفة.',
          code: e.code,
        );
      case 'credential-already-in-use':
        return FirebaseAuthFailure(
          message: 'بيانات الاعتماد هذه مستخدمة بالفعل.',
          code: e.code,
        );
      default:
        return FirebaseAuthFailure(
          message: e.message ?? 'حدث خطأ في تسجيل الدخول.',
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

class AuthenticationException implements Exception {
  final String message;
  AuthenticationException(this.message);
}

class DatabaseException implements Exception {
  final String message;
  DatabaseException(this.message);
}
