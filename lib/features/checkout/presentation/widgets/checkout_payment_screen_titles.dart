import 'package:advanced_ecommerce/core/Utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CheckOutPaymentScreenTitles extends StatelessWidget {
  const CheckOutPaymentScreenTitles({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'أختار طريقه الدفع المناسبه :',
              style: AppStyles.styleBold13(context)
                  .copyWith(color: const Color(0XFF0C0D0D)),
            ),
            const Gap(13),
            Text(
              'من فضلك اختر طريقه الدفع المناسبه لك.',
              style: AppStyles.styleRegular13(context)
                  .copyWith(color: const Color(0XFF616A6B)),
            ),
          ],
        ),
      ),
    );
  }
}
