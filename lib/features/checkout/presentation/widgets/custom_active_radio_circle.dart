import 'package:advanced_ecommerce/core/Utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomActiveRadioCircle extends StatelessWidget {
  const CustomActiveRadioCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9999), color: Colors.white),
        child: Center(
          child: Container(
            width: 11,
            height: 11,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9999),
                color: AppColors.kPrimaryColor),
          ),
        ),
      ),
    );
  }
}
