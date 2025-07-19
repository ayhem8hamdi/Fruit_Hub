import 'package:advanced_ecommerce/core/Utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomMenuText extends StatelessWidget {
  const CustomMenuText({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppStyles.styleSemiBold11(context).copyWith(
        color: const Color(0XFF949D9E),
      ),
    );
  }
}
