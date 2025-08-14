import 'package:advanced_ecommerce/core/Utils/app_assets.dart';
import 'package:advanced_ecommerce/core/Utils/app_styles.dart';
import 'package:advanced_ecommerce/features/home/data/models/fruit_model.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class FruitPricingRow extends StatelessWidget {
  const FruitPricingRow({super.key, required this.fruitModel});
  final FruitModel fruitModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              fruitModel.productName,
              style: AppStyles.styleSemiBold13(context)
                  .copyWith(color: Colors.black),
            ),
            const Gap(6),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                      text: fruitModel.price,
                      style: AppStyles.styleBold13(context)
                          .copyWith(color: const Color(0XFFF4A91F))),
                  TextSpan(
                      text: ' / الكيلو',
                      style: AppStyles.styleSemiBold13(context)
                          .copyWith(color: const Color(0XFFF8C76D))),
                ],
              ),
            )
          ],
        ),
        const Spacer(),
        Image.asset(Assets.addIcon)
      ],
    );
  }
}
