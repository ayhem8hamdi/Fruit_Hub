import 'package:advanced_ecommerce/core/Utils/app_assets.dart';
import 'package:advanced_ecommerce/core/Utils/app_styles.dart';
import 'package:advanced_ecommerce/core/Utils/responsive_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class QuantityWidget extends StatelessWidget {
  const QuantityWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ResponsiveImage(
          imageDesignWidth: 36,
          screenDesignWidth: 375,
          imageDesignAspectRatio: 1,
          customImageWidget: SvgPicture.asset(Assets.svgaddproductIcon),
        ),
        const Gap(16),
        Text(
          '4',
          style: AppStyles.styleBold16(context)
              .copyWith(color: const Color(0XFF06140C)),
        ),
        const Gap(16),
        ResponsiveImage(
            imageDesignWidth: 36,
            screenDesignWidth: 375,
            imageDesignAspectRatio: 1,
            customImageWidget: SvgPicture.asset(Assets.svgRemoveProductIcon)),
      ],
    );
  }
}
