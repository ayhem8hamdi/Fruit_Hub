import 'package:advanced_ecommerce/core/Utils/app_assets.dart';
import 'package:advanced_ecommerce/core/Utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class FruitPricingRow extends StatelessWidget {
  const FruitPricingRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'فراولة',
              style: AppStyles.styleSemiBold13(context)
                  .copyWith(color: Colors.black),
            ),
            const Gap(6),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                      text: '30 جنية',
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
