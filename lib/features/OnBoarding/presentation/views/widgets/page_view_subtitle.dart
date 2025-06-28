import 'package:advanced_ecommerce/core/Utils/app_styles.dart';
import 'package:flutter/material.dart';

class PageViewItemSubtitle extends StatelessWidget {
  const PageViewItemSubtitle({super.key, required this.subtitle});
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 37),
      child: Text(
        subtitle,
        style: AppStyles.styleSemiBold13,
        textAlign: TextAlign.center,
      ),
    );
  }
}
