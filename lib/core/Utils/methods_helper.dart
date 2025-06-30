import 'package:advanced_ecommerce/core/Utils/app_styles.dart';
import 'package:advanced_ecommerce/core/Utils/ui_errors_handler.dart';
import 'package:flutter/material.dart';

abstract class MethodsHelper {
  static String? validateFullName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'يرجى إدخال الاسم الكامل';
    }
    if (value.trim().length < 3) {
      return 'يجب أن يحتوي الاسم الكامل على 3 أحرف على الأقل';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'يرجى إدخال البريد الإلكتروني';
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'يرجى إدخال بريد إلكتروني صالح';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'يرجى إدخال كلمة المرور';
    }
    if (value.length < 8) {
      return 'يجب أن تكون كلمة المرور 8 أحرف على الأقل';
    }
    return null;
  }

  static OutlineInputBorder enabledFocusedBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(
        color: Color(0xFFE6E9EA),
        width: 1.4,
      ),
    );
  }

  static UnderlineInputBorder errorBorder() {
    return const UnderlineInputBorder(
      borderSide: BorderSide(
        color: Colors.green,
        width: 2.0,
      ),
    );
  }

  static OutlineInputBorder focusedErrorBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(
        color: Colors.green,
        width: 1.4,
      ),
    );
  }

  static TextStyle errorTextStyle(BuildContext context) {
    return AppStyles.styleBold13(context).copyWith(color: Colors.green);
  }

  static OutlineInputBorder orangeFocusedBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: Color(0XFFF4A91F), width: 1.8),
    );
  }

  static TextStyle codeTextStyle({required bool isFocused}) {
    return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: isFocused ? const Color(0XFFF4A91F) : Colors.black,
    );
  }

  static String? validateSingleDigit(String? value) {
    if (value == null || value.trim().isEmpty || value.trim().length != 1) {
      return '';
    }
    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'يرجى إدخال رقم الهاتف';
    }
    if (value.trim().length != 8) {
      return 'يجب أن يحتوي رقم الهاتف على 8 أرقام';
    }
    return null;
  }

  static void handleSignUpSubmission({
    required BuildContext context,
    required GlobalKey<FormState> formKey,
    required bool acceptedTerms,
    required VoidCallback onSuccess,
  }) {
    final isFormValid = formKey.currentState?.validate() ?? false;

    if (!isFormValid) return;

    if (!acceptedTerms) {
      UiHandler.showFlushBar(
          context, 'يرجى الموافقة على الشروط والأحكام أولاً');
      return;
    }
    onSuccess();
  }

  static OutlineInputBorder errorCodeBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(
        color: Colors.transparent,
        width: 1.4,
      ),
    );
  }

  static OutlineInputBorder focusedErrorCodeBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(
        color: Colors.transparent,
        width: 1.4,
      ),
    );
  }
}
