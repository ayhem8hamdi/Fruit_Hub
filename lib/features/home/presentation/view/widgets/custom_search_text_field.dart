import 'package:advanced_ecommerce/core/Utils/app_assets.dart';
import 'package:advanced_ecommerce/core/Utils/app_styles.dart';
import 'package:advanced_ecommerce/core/Utils/methods_helper.dart';
import 'package:advanced_ecommerce/features/home/presentation/view/widgets/custom_box_shadow_container.dart';
import 'package:advanced_ecommerce/features/home/presentation/view/widgets/custom_search_bar_icon.dart';
import 'package:flutter/material.dart';

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
    return CustomBoxShadowContainer(
        widget: TextFormField(
      controller: controller,
      validator: validator,
      style: AppStyles.styleSemiBold16(context)
          .copyWith(color: const Color(0xFF0C0D0D)),
      decoration: InputDecoration(
        focusColor: Colors.white,
        hoverColor: Colors.white,
        prefixIcon: const SearchBarCusromIcon(
          svgName: Assets.searchIcon,
        ),
        suffixIcon: const SearchBarCusromIcon(
          svgName: Assets.filterIcon,
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
        enabledBorder: MethodsHelper.whiteBorder(),
        focusedBorder: MethodsHelper.whiteBorder(),
        focusedErrorBorder: MethodsHelper.whiteBorder(),
        errorBorder: MethodsHelper.whiteBorder(),
        errorStyle: MethodsHelper.errorTextStyle(context),
      ),
    ));
  }
}
