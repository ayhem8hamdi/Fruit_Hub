import 'package:advanced_ecommerce/core/Utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class OrderInfosColumn extends StatelessWidget {
  const OrderInfosColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'طلب رقم: 1234567#',
          style: AppStyles.styleBold13(context)
              .copyWith(color: const Color(0XFF000000)),
        ),
        const Gap(8),
        Text(
          'تم الطلب :22 مارس ,2024',
          style: AppStyles.styleRegular13(context)
              .copyWith(fontSize: 11, color: const Color(0XFF949D9E)),
        ),
        const Gap(8),
        Row(
          children: [
            Text(
              'عدد الطلبات',
              style: AppStyles.styleRegular13(context)
                  .copyWith(color: const Color(0XFF949D9E)),
            ),
            Text(' : 10',
                style: AppStyles.styleBold13(context)
                    .copyWith(color: const Color(0XFF0C0D0D))),
            const Gap(26),
            Text('250 جنية',
                style: AppStyles.styleBold13(context)
                    .copyWith(color: const Color(0XFF0C0D0D))),
          ],
        )
      ],
    );
  }
}
