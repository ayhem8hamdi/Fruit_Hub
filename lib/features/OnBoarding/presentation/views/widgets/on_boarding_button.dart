import 'package:advanced_ecommerce/core/Utils/app_colors.dart';
import 'package:advanced_ecommerce/core/Utils/app_styles.dart';
import 'package:flutter/material.dart';

class OnBoardingButton extends StatelessWidget {
  final bool? isActive;
  final VoidCallback? onTap;
  final String? text;
  final Widget? widget;

  const OnBoardingButton({
    super.key,
    this.isActive = true,
    this.onTap,
    this.text,
    this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: widget ??
          Container(
            decoration: BoxDecoration(
              color: isActive! ? AppColors.kPrimaryColor : Colors.transparent,
              borderRadius: BorderRadius.circular(18),
            ),
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 19),
              child: Text(
                text!,
                style: AppStyles.styleBold16(context).copyWith(
                  color: isActive! ? Colors.white : Colors.transparent,
                ),
              ),
            ),
          ),
    );
  }
}
