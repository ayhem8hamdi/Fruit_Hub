import 'package:advanced_ecommerce/core/Utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class InActivePaymentTimeChoice extends StatelessWidget {
  const InActivePaymentTimeChoice({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: IntrinsicHeight(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding:
              const EdgeInsets.only(top: 19, bottom: 19, left: 13, right: 2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: const Color(0XFFF2F3F3).withOpacity(0.4),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomInActiveRadioCircle(),
              const Gap(12),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'الدفع عند الاستلام',
                    style: AppStyles.styleSemiBold13(context)
                        .copyWith(color: const Color(0XFF000000)),
                  ),
                  const Gap(8),
                  Text(
                    'التسليم من المكان',
                    style: AppStyles.styleRegular13(context)
                        .copyWith(color: Colors.grey),
                  ),
                ],
              ),
              const Spacer(),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  '40 جنيه',
                  style: AppStyles.styleBold13(context)
                      .copyWith(color: const Color(0XFF3A8B33)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomInActiveRadioCircle extends StatelessWidget {
  const CustomInActiveRadioCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9999),
            border: Border.all(
              width: 1,
              color: const Color(0XFF949D9E),
            )),
      ),
    );
  }
}
