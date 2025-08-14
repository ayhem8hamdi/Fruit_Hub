import 'package:advanced_ecommerce/core/Utils/app_assets.dart';
import 'package:advanced_ecommerce/core/Utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class RangeSliderFormTitle extends StatelessWidget {
  const RangeSliderFormTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 9),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(Assets.pricingTagIcon),
          const Gap(8),
          Text(
            'السعر :',
            style: AppStyles.styleBold13(context)
                .copyWith(color: const Color(0XFF181001)),
          ),
        ],
      ),
    );
  }
}
