import 'package:advanced_ecommerce/core/Utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomUserAppBar extends StatelessWidget {
  const CustomUserAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        'حسابي',
        style: AppStyles.styleBold19(context),
        textAlign: TextAlign.center,
      ),
    ));
  }
}
