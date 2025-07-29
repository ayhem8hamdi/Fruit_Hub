import 'package:advanced_ecommerce/core/Utils/app_assets.dart';
import 'package:advanced_ecommerce/core/Utils/app_styles.dart';
import 'package:flutter/material.dart';

class PricingAndDeletingColumn extends StatelessWidget {
  const PricingAndDeletingColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Image.asset(Assets.deleteProductIcon),
          Text(
            '60 جنيه',
            style: AppStyles.styleBold16(context).copyWith(
              color: const Color(0XFFF4A91F),
            ),
          ),
        ],
      ),
    );
  }
}
