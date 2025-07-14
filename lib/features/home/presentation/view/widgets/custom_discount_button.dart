import 'package:advanced_ecommerce/core/Utils/app_colors.dart';
import 'package:advanced_ecommerce/core/Utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomDiscountButton extends StatelessWidget {
  const CustomDiscountButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 8),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(4)),
      child: Text(
        'تسوق الان',
        style: AppStyles.styleBold13(context)
            .copyWith(color: AppColors.kPrimaryColor),
      ),
    ));
  }
}
