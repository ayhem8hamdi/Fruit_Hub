import 'package:advanced_ecommerce/core/Utils/app_assets.dart';
import 'package:advanced_ecommerce/core/Utils/app_styles.dart';
import 'package:advanced_ecommerce/core/Utils/methods_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomPersonalDataTextField extends StatefulWidget {
  const CustomPersonalDataTextField({
    super.key,
    required this.hintText,
    required this.controller,
    this.isItInProfileData = false,
    this.validator,
  });

  final String hintText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool isItInProfileData;

  @override
  State<CustomPersonalDataTextField> createState() =>
      _CustomPersonalDataTextFieldState();
}

class _CustomPersonalDataTextFieldState
    extends State<CustomPersonalDataTextField> {
  bool _isEditable = false;
  bool _hasInitialized = false;

  void _enableEditing() {
    setState(() {
      _isEditable = true;

      if (!_hasInitialized && widget.controller.text.isEmpty) {
        widget.controller.text = widget.hintText;
        _hasInitialized = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      readOnly: !_isEditable,
      style: AppStyles.styleBold13(context)
          .copyWith(color: const Color(0xFF0C0D0D)),
      decoration: InputDecoration(
        suffixIcon: widget.isItInProfileData
            ? GestureDetector(
                onTap: _enableEditing,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                  child: SvgPicture.asset(
                    Assets.editIcon,
                    fit: BoxFit.none,
                  ),
                ),
              )
            : const SizedBox.shrink(),
        isDense: true,
        hintText: _isEditable ? null : widget.hintText,
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
