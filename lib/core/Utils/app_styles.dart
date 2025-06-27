import 'package:advanced_ecommerce/core/Utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppStyles {
  static final TextStyle baseCairo = GoogleFonts.cairo();

  static final TextStyle styleBold23 = baseCairo.copyWith(
    color: Colors.black,
    fontSize: 23,
    fontWeight: FontWeight.w700,
  );

  static final TextStyle styleSemiBold13 = baseCairo.copyWith(
    color: AppColors.kThirdColor,
    fontSize: 13,
    fontWeight: FontWeight.w600,
  );
  static final TextStyle styleBold19 = baseCairo.copyWith(
    color: Colors.black,
    fontSize: 19,
    fontWeight: FontWeight.w700,
  );
  static final TextStyle styleBold13 = baseCairo.copyWith(
    color: AppColors.kSecondaryColor,
    fontSize: 13,
    fontWeight: FontWeight.w700,
  );
  static final TextStyle styleBold16 = baseCairo.copyWith(
    color: const Color(0XFFFFFFFF),
    fontSize: 16,
    fontWeight: FontWeight.w700,
  );
  static final TextStyle styleSemiBold16 = baseCairo.copyWith(
    color: AppColors.kPrimaryColor,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );
}
