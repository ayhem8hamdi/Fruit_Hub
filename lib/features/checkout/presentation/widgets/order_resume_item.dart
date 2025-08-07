import 'package:advanced_ecommerce/core/Utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class OrderResumeItem extends StatelessWidget {
  const OrderResumeItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 4),
        margin: const EdgeInsets.symmetric(horizontal: 19),
        decoration: BoxDecoration(
            color: const Color(0XFFF2F3F3).withOpacity(0.4),
            borderRadius: BorderRadius.circular(4)),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                OrderResumeItemRightColumn(),
                Spacer(),
                OrderResumeItemLeftColumn(),
              ],
            ),
            const Gap(9),
            const OrderItemCustomDivider(),
            const Gap(9),
            Row(
              children: [
                Text(
                  'الكلي',
                  style: AppStyles.styleBold16(context)
                      .copyWith(color: const Color(0XFF0C0D0D)),
                ),
                const Spacer(),
                Text('180 جنيه',
                    style: AppStyles.styleBold16(context)
                        .copyWith(color: const Color(0XFF0C0D0D)))
              ],
            )
          ],
        ),
      ),
    );
  }
}

class OrderItemCustomDivider extends StatelessWidget {
  const OrderItemCustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Spacer(flex: 1),
        Expanded(
          flex: 9,
          child: Divider(
            color: Color(0XFFCACECE),
            thickness: 0.78,
          ),
        ),
        Spacer(flex: 1),
      ],
    );
  }
}

class OrderResumeItemLeftColumn extends StatelessWidget {
  const OrderResumeItemLeftColumn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '150 جنيه',
          style: AppStyles.styleSemiBold16(context)
              .copyWith(color: const Color(0XFF0C0D0D)),
        ),
        const Gap(9),
        Text(
          '30 جنيه',
          style: AppStyles.styleSemiBold13(context)
              .copyWith(color: const Color(0XFF4E5556)),
        )
      ],
    );
  }
}

class OrderResumeItemRightColumn extends StatelessWidget {
  const OrderResumeItemRightColumn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'المجموع الفرعي :',
          style: AppStyles.styleRegular13(context)
              .copyWith(color: const Color(0XFF4E5556)),
        ),
        const Gap(9),
        Text(
          'التوصيل  :',
          style: AppStyles.styleRegular13(context)
              .copyWith(color: const Color(0XFF4E5556)),
        ),
      ],
    );
  }
}
