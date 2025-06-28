import 'package:advanced_ecommerce/core/Utils/app_colors.dart';
import 'package:advanced_ecommerce/core/Utils/app_styles.dart';
import 'package:flutter/material.dart';

class OnBoardingButton extends StatelessWidget {
  final bool isActive;
  final VoidCallback? onTap;

  const OnBoardingButton({
    super.key,
    required this.isActive,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(left: 16, right: 16, bottom: 43, top: 29),
        decoration: BoxDecoration(
          color: isActive ? AppColors.kPrimaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
        ),
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 19),
          child: Text(
            'ابدأ الآن',
            style: AppStyles.styleBold16(context).copyWith(
              color: isActive ? Colors.white : Colors.transparent,
            ),
          ),
        ),
      ),
    );
  }
}
