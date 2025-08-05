import 'package:advanced_ecommerce/core/Utils/app_styles.dart';
import 'package:advanced_ecommerce/features/card_and_products_details/presentation/views/widgets/custom_card_appbar.dart';
import 'package:advanced_ecommerce/features/checkout/presentation/widgets/check_out_step_row.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CheckoutPayScreenBody extends StatelessWidget {
  const CheckoutPayScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        CustomCardAppBar(
          title: 'الدفع',
        ),
        SliverGap(16),
        CheckoutStepsRow(
          stepNumber: 2,
        ),
        SliverGap(24),
        CheckOutPaymentScreenTitle()
      ],
    );
  }
}

class CheckOutPaymentScreenTitle extends StatelessWidget {
  const CheckOutPaymentScreenTitle({
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
            const Gap(13),
          ],
        ),
      ),
    );
  }
}
