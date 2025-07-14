import 'package:advanced_ecommerce/core/Utils/app_styles.dart';
import 'package:advanced_ecommerce/features/home/presentation/view/widgets/custom_discount_button.dart';
import 'package:advanced_ecommerce/features/home/presentation/view/widgets/soft_left_curve_clipper.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CustomCurvedContainer extends StatelessWidget {
  const CustomCurvedContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: SoftLeftCurveClipper(),
      child: Container(
        color: const Color(0XFF5DB957),
        padding:
            const EdgeInsets.only(right: 27, top: 29, bottom: 29, left: 36),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                'عروض العيد',
                style: AppStyles.styleRegular13(context),
              ),
            ),
            const Gap(3),
            const Expanded(child: const CustomCurvedContainerTitles()),
            const Gap(12),
            const CustomDiscountButton()
          ],
        ),
      ),
    );
  }
}

class CustomCurvedContainerTitles extends StatelessWidget {
  const CustomCurvedContainerTitles({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
              text: 'خصم ',
              style: AppStyles.styleBold19(context)
                  .copyWith(color: const Color(0XFFFFFFFF))),
          TextSpan(
              text: '25%',
              style: AppStyles.styleBold19(context)
                  .copyWith(color: const Color(0XFFFFFFFF))),
        ],
      ),
    );
  }
}
