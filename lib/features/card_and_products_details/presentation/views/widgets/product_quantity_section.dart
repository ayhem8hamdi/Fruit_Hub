import 'package:advanced_ecommerce/core/Utils/app_assets.dart';
import 'package:advanced_ecommerce/core/Utils/app_styles.dart';
import 'package:flutter/material.dart';

class ProductQuantitySection extends StatelessWidget {
  const ProductQuantitySection({super.key});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            Assets.addProductIcon,
          ),
          const SizedBox(width: 12),
          Text(
            '3',
            style: AppStyles.styleBold16(context).copyWith(color: Colors.black),
          ),
          const SizedBox(width: 12),
          Image.asset(
            Assets.removeProductIcon,
          ),
        ],
      ),
    );
  }
}
