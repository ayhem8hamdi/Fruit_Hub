import 'package:advanced_ecommerce/core/Utils/app_colors.dart';
import 'package:advanced_ecommerce/core/Utils/app_styles.dart';
import 'package:flutter/material.dart';

class PopUpLogoutButton extends StatelessWidget {
  const PopUpLogoutButton({
    super.key,
    this.onTap,
    this.text,
    this.color,
  });
  final VoidCallback? onTap;
  final String? text;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: color ?? AppColors.kPrimaryColor,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.kPrimaryColor)),
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: text == "التالي" ? 13 : 9),
        child: Text(
          text ?? '',
          style: AppStyles.styleBold16(context).copyWith(
            color: color == null ? Colors.white : AppColors.kPrimaryColor,
          ),
        ),
      ),
    );
  }
}
