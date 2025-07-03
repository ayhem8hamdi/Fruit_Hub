import 'package:advanced_ecommerce/core/Utils/app_colors.dart';
import 'package:advanced_ecommerce/core/Utils/app_styles.dart';
import 'package:flutter/material.dart';

class OnBoardingButton extends StatelessWidget {
  final bool? isActive;
  final VoidCallback? onTap;
  final String? text;
  final bool isLoading;

  const OnBoardingButton({
    super.key,
    this.isActive = true,
    this.onTap,
    this.text,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isActive! && !isLoading ? onTap : null,
      child: Container(
        decoration: BoxDecoration(
          color: isActive! ? AppColors.kPrimaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(18),
        ),
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 19),
        child: isLoading
            ? const SizedBox(
                height: 24,
                width: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : Text(
                text ?? '',
                style: AppStyles.styleBold16(context).copyWith(
                  color: isActive! ? Colors.white : Colors.transparent,
                ),
              ),
      ),
    );
  }
}
