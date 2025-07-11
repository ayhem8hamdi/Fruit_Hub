import 'dart:async';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class Failure {
  final String message;
  final String code;

  Failure({required this.message, required this.code});

  factory Failure.fromException(Object error) {
    if (error is AuthException) {
      return SupabaseAuthFailure.fromSupabaseAuthException(error);
    } else if (error is PostgrestException) {
      return SupabaseDatabaseFailure.fromSupabaseDatabaseException(error);
    } else if (error is StorageException) {
      return SupabaseStorageFailure.fromSupabaseStorageException(error);
    } else if (error is PlatformException) {
      return PlatformFailure(
        message: error.message ?? 'حدث خطأ في النظام الأساسي للجهاز',
        code: error.code,
      );
    } else if (error is FormatException) {
      return ParsingFailure(
        message: 'تعذر معالجة البيانات، يرجى المحاولة مرة أخرى',
        code: 'DATA_PARSING_ERROR',
      );
    } else if (error is TimeoutException) {
      return NetworkFailure(
        message:
            'تأخر في الاتصال بالخادم، يرجى التحقق من اتصال الإنترنت والمحاولة مرة أخرى',
        code: 'TIMEOUT_ERROR',
      );
    } else if (error is SocketException) {
      return NetworkFailure(
        message: 'تعذر الاتصال بالإنترنت، يرجى التحقق من اتصالك الشبكي',
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
        message: 'حدث خطأ غير متوقع، يرجى المحاولة مرة أخرى لاحقاً',
        code: 'UNKNOWN_ERROR',
      );
    }
  }
}

class SupabaseAuthFailure extends Failure {
  SupabaseAuthFailure({required super.message, required super.code});

  factory SupabaseAuthFailure.fromSupabaseAuthException(AuthException e) {
    final statusCode = e.statusCode ?? 'UNKNOWN';

    switch (statusCode) {
      // Common Authentication Errors
      case '400':
        return SupabaseAuthFailure(
          message: 'طلب غير صالح، يرجى التحقق من البيانات المدخلة',
          code: statusCode,
        );
      case '401':
        return SupabaseAuthFailure(
          message: 'ليس لديك صلاحية الدخول، يرجى تسجيل الدخول أولاً',
          code: statusCode,
        );
      case '403':
        return SupabaseAuthFailure(
          message: 'غير مسموح لك بهذا الإجراء',
          code: statusCode,
        );
      case '404':
        return SupabaseAuthFailure(
          message: 'لم يتم العثور على الصفحة المطلوبة',
          code: statusCode,
        );
      case '422':
        return SupabaseAuthFailure(
          message: 'بيانات غير صالحة، يرجى التحقق من المدخلات',
          code: statusCode,
        );
      case '429':
        return SupabaseAuthFailure(
          message: 'لقد تجاوزت عدد المحاولات المسموحة، يرجى الانتظار قليلاً',
          code: statusCode,
        );
      case '500':
        return SupabaseAuthFailure(
          message: 'خطأ في الخادم، يرجى المحاولة لاحقاً',
          code: statusCode,
        );
      default:
        return _mapAuthErrorMessage(e, statusCode);
    }
  }

  static SupabaseAuthFailure _mapAuthErrorMessage(
      AuthException e, String statusCode) {
    final message = e.message.toLowerCase();

    if (message.contains('email') && message.contains('already in use')) {
      return SupabaseAuthFailure(
        message:
            'هذا البريد الإلكتروني مستخدم بالفعل، جرب تسجيل الدخول أو استعادة كلمة المرور',
        code: statusCode,
      );
    } else if (message.contains('invalid login credentials')) {
      return SupabaseAuthFailure(
        message: 'البريد الإلكتروني أو كلمة المرور غير صحيحة',
        code: statusCode,
      );
    } else if (message.contains('email not confirmed')) {
      return SupabaseAuthFailure(
        message:
            'لم يتم تأكيد البريد الإلكتروني بعد، يرجى التحقق من بريدك الوارد',
        code: statusCode,
      );
    } else if (message.contains('invalid email')) {
      return SupabaseAuthFailure(
        message: 'بريد إلكتروني غير صالح، يرجى إدخال بريد صحيح',
        code: statusCode,
      );
    } else if (message.contains('weak password')) {
      return SupabaseAuthFailure(
        message: 'كلمة المرور ضعيفة، يجب أن تحتوي على 6 أحرف على الأقل',
        code: statusCode,
      );
    } else if (message.contains('user not found')) {
      return SupabaseAuthFailure(
        message: 'لا يوجد حساب مرتبط بهذا البريد الإلكتروني',
        code: statusCode,
      );
    } else if (message.contains('too many requests')) {
      return SupabaseAuthFailure(
        message:
            'عدد محاولات تسجيل الدخول أكثر من المسموح، يرجى الانتظار قبل المحاولة مرة أخرى',
        code: statusCode,
      );
    } else if (message.contains('provider')) {
      return SupabaseAuthFailure(
        message: 'خطأ في تسجيل الدخول عبر الوسيط المحدد',
        code: statusCode,
      );
    } else {
      return SupabaseAuthFailure(
        message: 'حدث خطأ أثناء المصادقة: ${e.message}',
        code: statusCode,
      );
    }
  }
}

class SupabaseDatabaseFailure extends Failure {
  SupabaseDatabaseFailure({required super.message, required super.code});

  factory SupabaseDatabaseFailure.fromSupabaseDatabaseException(
      PostgrestException e) {
    final code = e.code ?? 'DATABASE_ERROR';
    final message = e.message;

    switch (code) {
      case '23505':
        return SupabaseDatabaseFailure(
          message: 'هذه البيانات موجودة مسبقاً في النظام',
          code: code,
        );
      case '23503':
        return SupabaseDatabaseFailure(
          message: 'لا يمكن حذف هذا العنصر لأنه مرتبط ببيانات أخرى',
          code: code,
        );
      case '23502':
        return SupabaseDatabaseFailure(
          message: 'بعض الحقول المطلوبة فارغة',
          code: code,
        );
      case '22P02':
        return SupabaseDatabaseFailure(
          message: 'نوع البيانات المدخلة غير متطابق مع ما هو مطلوب',
          code: code,
        );
      case '42601':
        return SupabaseDatabaseFailure(
          message: 'خطأ في بناء جملة الاستعلام',
          code: code,
        );
      case '42501':
        return SupabaseDatabaseFailure(
          message: 'ليس لديك صلاحية تنفيذ هذا الإجراء',
          code: code,
        );
      case '42P01':
        return SupabaseDatabaseFailure(
          message: 'الجدول المطلوب غير موجود',
          code: code,
        );
      case '42P07':
        return SupabaseDatabaseFailure(
          message: 'الجدول المطلوب موجود بالفعل',
          code: code,
        );
      case 'P0001':
        return SupabaseDatabaseFailure(
          message: 'تم إيقاف العملية بسبب قيود محددة',
          code: code,
        );
      default:
        return SupabaseDatabaseFailure(
          message: 'حدث خطأ في قاعدة البيانات: $message',
          code: code,
        );
    }
  }
}

class SupabaseStorageFailure extends Failure {
  SupabaseStorageFailure({required super.message, required super.code});

  factory SupabaseStorageFailure.fromSupabaseStorageException(
      StorageException e) {
    final statusCode = e.statusCode ?? 'UNKNOWN';
    final message = e.message;

    switch (statusCode) {
      case '400':
        return SupabaseStorageFailure(
          message: 'طلب التخزين غير صالح، يرجى التحقق من الملف المراد رفعه',
          code: statusCode,
        );
      case '401':
        return SupabaseStorageFailure(
          message: 'ليس لديك صلاحية رفع الملفات',
          code: statusCode,
        );
      case '403':
        return SupabaseStorageFailure(
          message: 'غير مسموح لك برفع الملفات',
          code: statusCode,
        );
      case '404':
        return SupabaseStorageFailure(
          message: 'الملف المطلوب غير موجود',
          code: statusCode,
        );
      case '413':
        return SupabaseStorageFailure(
          message: 'حجم الملف كبير جداً، يرجى اختيار ملف أصغر',
          code: statusCode,
        );
      case '422':
        return SupabaseStorageFailure(
          message: 'نوع الملف غير مدعوم، يرجى اختيار نوع آخر',
          code: statusCode,
        );
      case '500':
        return SupabaseStorageFailure(
          message: 'خطأ في خادم التخزين، يرجى المحاولة لاحقاً',
          code: statusCode,
        );
      default:
        return SupabaseStorageFailure(
          message: 'حدث خطأ أثناء معالجة الملف: $message',
          code: statusCode,
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
