import 'package:advanced_ecommerce/core/Utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomBorderTextField extends StatelessWidget {
  const CustomBorderTextField({
    super.key,
    required this.hintText,
  });

  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: AppStyles.styleSemiBold16(context)
          .copyWith(color: const Color(0XFF0C0D0D)),
      decoration: InputDecoration(
        isDense: true,
        hintText: hintText,
        hintStyle: AppStyles.styleBold13(context),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 20,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFFE6E9EA),
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFFE6E9EA),
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
