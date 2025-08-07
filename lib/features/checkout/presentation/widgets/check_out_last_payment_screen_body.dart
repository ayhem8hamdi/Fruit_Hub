import 'package:advanced_ecommerce/core/Utils/app_assets.dart';
import 'package:advanced_ecommerce/core/Utils/app_styles.dart';
import 'package:advanced_ecommerce/features/card_and_products_details/presentation/views/widgets/custom_card_appbar.dart';
import 'package:advanced_ecommerce/features/checkout/presentation/widgets/check_out_step_row.dart';
import 'package:advanced_ecommerce/features/checkout/presentation/widgets/order_resume_item.dart';
import 'package:advanced_ecommerce/features/checkout/presentation/widgets/order_resume_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class CheckoutLastPaymentScreenBody extends StatelessWidget {
  const CheckoutLastPaymentScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        CustomCardAppBar(
          title: 'الدفع',
        ),
        SliverGap(16),
        CheckoutStepsRow(
          stepNumber: 3,
        ),
        SliverGap(24),
        OrderResumeTitle(
          title: 'ملخص الطلب :',
        ),
        SliverGap(8),
        OrderResumeItem(),
        SliverGap(16),
        OrderResumeTitle(title: 'يرجي تأكيد  طلبك'),
        SliverGap(8),
        ConfirmPaymentMethodItem()
      ],
    );
  }
}

class ConfirmPaymentMethodItem extends StatelessWidget {
  const ConfirmPaymentMethodItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 9),
        margin: const EdgeInsets.symmetric(horizontal: 19),
        decoration: BoxDecoration(
            color: const Color(0XFFF2F3F3).withOpacity(0.4),
            borderRadius: BorderRadius.circular(4)),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'وسيلة الدفع',
                  style: AppStyles.styleBold13(context)
                      .copyWith(color: Colors.black),
                ),
                Spacer(),
                Row(
                  children: [
                    SvgPicture.asset(
                      Assets.editIcon,
                      color: const Color(0XFF6C7275),
                    ),
                    Gap(4),
                    Text(
                      'تعديل',
                      style: AppStyles.styleSemiBold13(context)
                          .copyWith(color: const Color(0XFF949D9E)),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
