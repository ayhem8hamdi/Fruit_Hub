import 'package:advanced_ecommerce/core/Utils/app_colors.dart';
import 'package:advanced_ecommerce/core/Utils/app_styles.dart';
import 'package:advanced_ecommerce/features/checkout/presentation/widgets/checkout_screen_body.dart';
import 'package:advanced_ecommerce/features/checkout/presentation/widgets/custom_active_radio_circle.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ActivePaymentTimeChoice extends StatelessWidget {
  const ActivePaymentTimeChoice({
    super.key,
    required this.paymentItemModel,
  });
  final PaymentItemModel paymentItemModel;
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.only(top: 19, bottom: 19, left: 13, right: 2),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.kPrimaryColor),
          borderRadius: BorderRadius.circular(4),
          color: const Color(0XFFF2F3F3).withOpacity(0.4),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomActiveRadioCircle(),
            const Gap(12),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  paymentItemModel.title,
                  style: AppStyles.styleSemiBold13(context)
                      .copyWith(color: const Color(0XFF000000)),
                ),
                const Gap(8),
                Text(
                  paymentItemModel.subTitle,
                  style: AppStyles.styleRegular13(context)
                      .copyWith(color: Colors.grey),
                ),
              ],
            ),
            const Spacer(),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                paymentItemModel.price,
                style: AppStyles.styleBold13(context)
                    .copyWith(color: const Color(0XFF3A8B33)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
