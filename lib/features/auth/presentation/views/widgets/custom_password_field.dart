import 'package:advanced_ecommerce/core/Utils/methods_helper.dart';
import 'package:flutter/material.dart';
import 'package:advanced_ecommerce/core/Utils/app_styles.dart';

class CustomPasswordTextField extends StatefulWidget {
  final String hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const CustomPasswordTextField({
    super.key,
    required this.hintText,
    this.controller,
    this.validator,
  });

  @override
  State<CustomPasswordTextField> createState() =>
      _CustomPasswordTextFieldState();
}

class _CustomPasswordTextFieldState extends State<CustomPasswordTextField> {
  bool _obscureText = true;

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      obscureText: _obscureText,
      style: AppStyles.styleSemiBold16(context)
          .copyWith(color: const Color(0xFF0C0D0D)),
      decoration: InputDecoration(
        isDense: true,
        hintText: widget.hintText,
        hintStyle: AppStyles.styleBold13(context),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 22,
          horizontal: 20,
        ),
        filled: true,
        fillColor: const Color(0xFFF9FAFA),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(left: 7),
          child: IconButton(
            icon: Icon(
              _obscureText ? Icons.visibility_off : Icons.visibility,
              color: Colors.grey,
            ),
            onPressed: _toggleVisibility,
          ),
        ),
        enabledBorder: MethodsHelper.enabledFocusedBorder(),
        focusedBorder: MethodsHelper.enabledFocusedBorder(),
        errorBorder: MethodsHelper.errorBorder(),
        focusedErrorBorder: MethodsHelper.focusedErrorBorder(),
        errorStyle: MethodsHelper.errorTextStyle(context),
      ),
    );
  }
}
