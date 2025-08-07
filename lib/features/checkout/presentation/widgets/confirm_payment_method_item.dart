import 'package:advanced_ecommerce/core/Utils/app_assets.dart';
import 'package:advanced_ecommerce/core/Utils/app_styles.dart';
import 'package:advanced_ecommerce/core/Utils/responsive_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class ConfirmPaymentMethodItem extends StatelessWidget {
  const ConfirmPaymentMethodItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 12),
        margin: const EdgeInsets.symmetric(horizontal: 19),
        decoration: BoxDecoration(
            color: const Color(0XFFF2F3F3).withOpacity(0.4),
            borderRadius: BorderRadius.circular(4)),
        child: Column(
          children: [
            ConfirmOrderScreenRow(
              text: 'وسيلة الدفع',
            ),
            const Gap(13),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '6522 **** **** ****',
                  style: AppStyles.styleRegular16(context)
                      .copyWith(color: const Color(0XFF4E5556)),
                ),
                const Gap(29),
                Container(
                  decoration: BoxDecoration(
                      color: const Color(0XFF1434CB),
                      borderRadius: BorderRadius.circular(4)),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 9, vertical: 12),
                  child: ResponsiveImage(
                    customImageWidget: SvgPicture.asset(
                      color: Colors.white,
                      Assets.paymentTwoIcon,
                    ),
                    imageDesignWidth: 35,
                    screenDesignWidth: 375,
                    imageDesignAspectRatio: 375 / 54,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ConfirmOrderScreenRow extends StatelessWidget {
  const ConfirmOrderScreenRow({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: AppStyles.styleBold13(context).copyWith(color: Colors.black),
        ),
        const Spacer(),
        Row(
          children: [
            SvgPicture.asset(
              Assets.editIcon,
              color: const Color(0XFF6C7275),
            ),
            const Gap(4),
            Text(
              'تعديل',
              style: AppStyles.styleSemiBold13(context)
                  .copyWith(color: const Color(0XFF949D9E)),
            )
          ],
        )
      ],
    );
  }
}
