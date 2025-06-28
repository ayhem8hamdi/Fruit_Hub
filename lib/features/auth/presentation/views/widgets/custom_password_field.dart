import 'package:flutter/material.dart';
import 'package:advanced_ecommerce/core/Utils/app_styles.dart';

class CustomPasswordTextField extends StatefulWidget {
  final String hintText;

  const CustomPasswordTextField({
    super.key,
    required this.hintText,
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

  OutlineInputBorder _customBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(
        color: Color(0xFFE6E9EA),
        width: 1.0,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: _obscureText,
      style: AppStyles.styleSemiBold16(context)
          .copyWith(color: const Color(0XFF0C0D0D)),
      decoration: InputDecoration(
        isDense: true,
        hintText: widget.hintText,
        hintStyle: AppStyles.styleBold13(context),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 20,
        ),
        suffixIcon: IconButton(
          icon: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Icon(
              _obscureText ? Icons.visibility_off : Icons.visibility,
              color: Colors.grey,
            ),
          ),
          onPressed: _toggleVisibility,
        ),
        enabledBorder: _customBorder(),
        focusedBorder: _customBorder(),
      ),
    );
  }
}
