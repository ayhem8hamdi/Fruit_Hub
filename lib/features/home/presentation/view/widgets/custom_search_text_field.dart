import 'package:advanced_ecommerce/core/Utils/app_assets.dart';
import 'package:advanced_ecommerce/core/Utils/app_styles.dart';
import 'package:advanced_ecommerce/core/Utils/methods_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({
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
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(3),
        boxShadow: const [
          BoxShadow(
            color: Color(0x05000000), // 10% black
            blurRadius: 4,
            offset: Offset(0, 2), // subtle downward shadow
            spreadRadius: 1,
          ),
          BoxShadow(
            color: Color(0x05000000), // lighter outer glow
            blurRadius: 3,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        validator: validator,
        style: AppStyles.styleSemiBold16(context)
            .copyWith(color: const Color(0xFF0C0D0D)),
        decoration: InputDecoration(
          focusColor: Colors.white,
          hoverColor: Colors.white,
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 19, right: 18),
            child: SvgPicture.asset(
              Assets.searchIcon,
              fit: BoxFit.none,
            ),
          ),
          isDense: true,
          hintText: hintText,
          hintStyle: AppStyles.styleBold13(context),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 18,
            horizontal: 20,
          ),
          filled: true,
          fillColor: Colors.white,
          enabledBorder: whiteBorder(),
          focusedBorder: whiteBorder(),
          focusedErrorBorder: whiteBorder(),
          errorBorder: whiteBorder(),
          errorStyle: MethodsHelper.errorTextStyle(context),
        ),
      ),
    );
  }

  OutlineInputBorder whiteBorder({double radius = 3}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius),
      borderSide: const BorderSide(color: Colors.white),
    );
  }
}
