import 'package:advanced_ecommerce/core/Utils/app_styles.dart';
import 'package:advanced_ecommerce/core/Utils/methods_helper.dart';
import 'package:flutter/material.dart';

class CustomBorderTextField extends StatelessWidget {
  const CustomBorderTextField({
    super.key,
    required this.hintText,
    this.controller,
    this.validator,
  });

  final String hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      style: AppStyles.styleSemiBold16(context)
          .copyWith(color: const Color(0xFF0C0D0D)),
      decoration: InputDecoration(
        isDense: true,
        hintText: hintText,
        hintStyle: AppStyles.styleBold13(context),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 22,
          horizontal: 20,
        ),
        filled: true,
        fillColor: const Color(0xFFF9FAFA),
        enabledBorder: MethodsHelper.enabledFocusedBorder(),
        focusedBorder: MethodsHelper.enabledFocusedBorder(),
        errorBorder: MethodsHelper.errorBorder(),
        focusedErrorBorder: MethodsHelper.focusedErrorBorder(),
        errorStyle: MethodsHelper.errorTextStyle(context),
      ),
    );
  }
}
