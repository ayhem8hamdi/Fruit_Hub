import 'package:advanced_ecommerce/core/Utils/app_colors.dart';
import 'package:flutter/material.dart';

class TimelineDot extends StatelessWidget {
  final bool isCompleted;

  const TimelineDot({super.key, required this.isCompleted});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isCompleted ? AppColors.kPrimaryColor : Colors.grey.shade500,
      ),
    );
  }
}
