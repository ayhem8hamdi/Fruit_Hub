import 'package:advanced_ecommerce/core/Utils/app_assets.dart';
import 'package:advanced_ecommerce/core/Utils/app_styles.dart';
import 'package:advanced_ecommerce/core/Utils/responsive_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class HorizListFruitItem extends StatelessWidget {
  const HorizListFruitItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ResponsiveImage(
          imageDesignWidth: 64,
          screenDesignWidth: 375,
          imageDesignAspectRatio: 1,
          customImageWidget: SvgPicture.asset(Assets.ananasIcon),
        ),
        const Gap(2),
        Text(
          'أناناس',
          style: AppStyles.styleBold13(context)
              .copyWith(color: Colors.black, height: 1.7),
        )
      ],
    );
  }
}
