import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class Failure {
  final String message;
  final String code;

  Failure({required this.message, required this.code});

  factory Failure.fromException(Object error) {
    if (error is FirebaseAuthException) {
      return FirebaseAuthFailure.fromFirebaseAuthException(error);
    } else if (error is FirebaseException) {
      return FirebaseFailure.fromFirebaseException(error);
    } else if (error is PlatformException) {
      return PlatformFailure(
        message: error.message ?? 'حدث خطأ في النظام الأساسي',
        code: error.code,
      );
    } else if (error is FormatException) {
      return ParsingFailure(
        message: 'خطأ في معالجة البيانات',
        code: 'DATA_PARSING_ERROR',
      );
    } else if (error is TimeoutException) {
      return NetworkFailure(
        message: 'انتهت مهلة الاتصال',
        code: 'TIMEOUT_ERROR',
      );
    } else if (error is SocketException) {
      return NetworkFailure(
        message: 'فشل الاتصال بالشبكة',
        code: 'NETWORK_ERROR',
      );
    } else if (error is AuthenticationException) {
      return AuthenticationFailure(
        message: error.message,
        code: 'AUTH_ERROR',
      );
    } else if (error is DatabaseException) {
      return DatabaseFailure(
        message: error.message,
        code: 'DATABASE_ERROR',
      );
    } else {
      return UnknownFailure(
        message: 'حدث خطأ غير متوقع',
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
      // Common Authentication Errors
      case 'invalid-email':
        return FirebaseAuthFailure(
          message: 'بريد إلكتروني غير صالح',
          code: e.code,
        );
      case 'user-disabled':
        return FirebaseAuthFailure(
          message: 'هذا الحساب معطل من قبل الإدارة',
          code: e.code,
        );
      case 'user-not-found':
        return FirebaseAuthFailure(
          message: 'لا يوجد حساب مسجل بهذا البريد الإلكتروني',
          code: e.code,
        );
      case 'wrong-password':
        return FirebaseAuthFailure(
          message: 'كلمة مرور غير صحيحة',
          code: e.code,
        );
      case 'email-already-in-use':
        return FirebaseAuthFailure(
          message: 'البريد الإلكتروني مستخدم بالفعل',
          code: e.code,
        );
      case 'operation-not-allowed':
        return FirebaseAuthFailure(
          message: 'هذه العملية غير مسموح بها',
          code: e.code,
        );
      case 'weak-password':
        return FirebaseAuthFailure(
          message: 'كلمة المرور ضعيفة (يجب أن تحتوي على 6 أحرف على الأقل)',
          code: e.code,
        );
      case 'too-many-requests':
        return FirebaseAuthFailure(
          message: 'تم تجاوز عدد المحاولات المسموحة، يرجى المحاولة لاحقاً',
          code: e.code,
        );
      case 'network-request-failed':
        return FirebaseAuthFailure(
          message: 'فشل الاتصال بالشبكة',
          code: e.code,
        );
      case 'requires-recent-login':
        return FirebaseAuthFailure(
          message: 'يجب تسجيل الدخول مرة أخرى لإكمال هذه العملية',
          code: e.code,
        );
      case 'provider-already-linked':
        return FirebaseAuthFailure(
          message: 'الحساب مرتبط بالفعل بهذه الخدمة',
          code: e.code,
        );

      // Phone Auth Errors
      case 'invalid-verification-code':
        return FirebaseAuthFailure(
          message: 'رمز التحقق غير صحيح',
          code: e.code,
        );
      case 'invalid-verification-id':
        return FirebaseAuthFailure(
          message: 'معرّف التحقق غير صالح',
          code: e.code,
        );
      case 'quota-exceeded':
        return FirebaseAuthFailure(
          message: 'تم تجاوز الحد المسموح من محاولات التحقق',
          code: e.code,
        );
      case 'session-expired':
        return FirebaseAuthFailure(
          message: 'انتهت صلاحية جلسة التحقق',
          code: e.code,
        );
      case 'missing-verification-code':
        return FirebaseAuthFailure(
          message: 'رمز التحقق مفقود',
          code: e.code,
        );
      case 'missing-verification-id':
        return FirebaseAuthFailure(
          message: 'معرّف التحقق مفقود',
          code: e.code,
        );

      // Social Auth Errors
      case 'account-exists-with-different-credential':
        return FirebaseAuthFailure(
          message: 'يوجد حساب آخر مرتبط بنفس البريد الإلكتروني',
          code: e.code,
        );
      case 'invalid-credential':
        return FirebaseAuthFailure(
          message: 'بيانات الاعتماد غير صالحة',
          code: e.code,
        );
      case 'credential-already-in-use':
        return FirebaseAuthFailure(
          message: 'بيانات الاعتماد مستخدمة بالفعل',
          code: e.code,
        );

      // Other Errors
      case 'app-not-authorized':
        return FirebaseAuthFailure(
          message: 'التطبيق غير مصرح له بالوصول',
          code: e.code,
        );
      case 'expired-action-code':
        return FirebaseAuthFailure(
          message: 'انتهت صلاحية رمز الإجراء',
          code: e.code,
        );
      case 'invalid-action-code':
        return FirebaseAuthFailure(
          message: 'رمز إجراء غير صالح',
          code: e.code,
        );
      case 'missing-ios-bundle-id':
        return FirebaseAuthFailure(
          message: 'معرف حزمة iOS مفقود',
          code: e.code,
        );
      case 'missing-android-pkg-name':
        return FirebaseAuthFailure(
          message: 'اسم حزمة Android مفقود',
          code: e.code,
        );
      case 'unauthorized-domain':
        return FirebaseAuthFailure(
          message: 'نطاق غير مصرح به',
          code: e.code,
        );
      case 'invalid-continue-uri':
        return FirebaseAuthFailure(
          message: 'رابط متابعة غير صالح',
          code: e.code,
        );
      case 'missing-continue-uri':
        return FirebaseAuthFailure(
          message: 'رابط المتابعة مفقود',
          code: e.code,
        );
      default:
        return FirebaseAuthFailure(
          message: e.message ?? 'فشل في عملية المصادقة',
          code: e.code,
        );
    }
  }
}

class FirebaseFailure extends Failure {
  FirebaseFailure({required super.message, required super.code});

  factory FirebaseFailure.fromFirebaseException(FirebaseException e) {
    switch (e.code) {
      case 'permission-denied':
        return FirebaseFailure(
          message: 'تم رفض الإذن',
          code: e.code,
        );
      case 'unavailable':
        return FirebaseFailure(
          message: 'الخدمة غير متوفرة حالياً',
          code: e.code,
        );
      case 'cancelled':
        return FirebaseFailure(
          message: 'تم إلغاء العملية',
          code: e.code,
        );
      case 'unknown':
        return FirebaseFailure(
          message: 'حدث خطأ غير معروف',
          code: e.code,
        );
      case 'invalid-argument':
        return FirebaseFailure(
          message: 'مدخلات غير صالحة',
          code: e.code,
        );
      case 'deadline-exceeded':
        return FirebaseFailure(
          message: 'انتهت مهلة العملية',
          code: e.code,
        );
      case 'not-found':
        return FirebaseFailure(
          message: 'المستند غير موجود',
          code: e.code,
        );
      case 'already-exists':
        return FirebaseFailure(
          message: 'المستند موجود بالفعل',
          code: e.code,
        );
      case 'resource-exhausted':
        return FirebaseFailure(
          message: 'تم استنفاذ الموارد',
          code: e.code,
        );
      case 'failed-precondition':
        return FirebaseFailure(
          message: 'فشل في الشرط المسبق',
          code: e.code,
        );
      case 'aborted':
        return FirebaseFailure(
          message: 'تم إيقاف العملية',
          code: e.code,
        );
      case 'out-of-range':
        return FirebaseFailure(
          message: 'قيمة خارج النطاق المسموح',
          code: e.code,
        );
      case 'unimplemented':
        return FirebaseFailure(
          message: 'العملية غير مدعومة',
          code: e.code,
        );
      case 'internal':
        return FirebaseFailure(
          message: 'خطأ داخلي في الخادم',
          code: e.code,
        );
      case 'data-loss':
        return FirebaseFailure(
          message: 'فقدان البيانات',
          code: e.code,
        );
      default:
        return FirebaseFailure(
          message: e.message ?? 'فشل في عملية قاعدة البيانات',
          code: e.code,
        );
    }
  }
}

class NetworkFailure extends Failure {
  NetworkFailure({required super.message, required super.code});
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

// Custom Exceptions
class AuthenticationException implements Exception {
  final String message;
  AuthenticationException(this.message);
}

class DatabaseException implements Exception {
  final String message;
  DatabaseException(this.message);
}

class NetworkException implements Exception {
  final String message;
  NetworkException(this.message);
}
