import 'package:advanced_ecommerce/core/Utils/app_colors.dart';
import 'package:advanced_ecommerce/core/Utils/responsive_font_size.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppStyles {
  static TextStyle _baseCairo(BuildContext context) => GoogleFonts.cairo();

  static TextStyle styleBold23(BuildContext context) =>
      _baseCairo(context).copyWith(
        color: Colors.black,
        fontSize: responsiveFontSize(context, fontSize: 23),
        fontWeight: FontWeight.w700,
      );

  static TextStyle styleSemiBold13(BuildContext context) =>
      _baseCairo(context).copyWith(
        color: AppColors.kThirdColor,
        fontSize: responsiveFontSize(context, fontSize: 13),
        fontWeight: FontWeight.w600,
      );

  static TextStyle styleBold19(BuildContext context) =>
      _baseCairo(context).copyWith(
        color: Colors.black,
        fontSize: responsiveFontSize(context, fontSize: 19),
        fontWeight: FontWeight.w700,
      );

  static TextStyle styleBold13(BuildContext context) =>
      _baseCairo(context).copyWith(
        color: AppColors.kSecondaryColor,
        fontSize: responsiveFontSize(context, fontSize: 13),
        fontWeight: FontWeight.w700,
      );

  static TextStyle styleBold16(BuildContext context) =>
      _baseCairo(context).copyWith(
          color: const Color(0XFFFFFFFF),
          fontSize: responsiveFontSize(context, fontSize: 16),
          fontWeight: FontWeight.w700,
          height: 1.4);

  static TextStyle styleSemiBold16(BuildContext context) =>
      _baseCairo(context).copyWith(
        color: AppColors.kPrimaryColor,
        fontSize: responsiveFontSize(context, fontSize: 16),
        fontWeight: FontWeight.w600,
      );
  static TextStyle styleRegular16(BuildContext context) =>
      _baseCairo(context).copyWith(
        color: const Color(0XFF949D9E),
        fontSize: responsiveFontSize(context, fontSize: 16),
        fontWeight: FontWeight.w400,
      );
  static TextStyle styleRegular13(BuildContext context) =>
      _baseCairo(context).copyWith(
        color: const Color(0XFFFFFFFF),
        fontSize: responsiveFontSize(context, fontSize: 13),
        fontWeight: FontWeight.w400,
      );
}
