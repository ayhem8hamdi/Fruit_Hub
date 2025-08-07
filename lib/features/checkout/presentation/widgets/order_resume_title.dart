import 'package:advanced_ecommerce/core/Utils/app_styles.dart';
import 'package:flutter/material.dart';

class OrderResumeTitle extends StatelessWidget {
  const OrderResumeTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Text(
          'ملخص الطلب :',
          style: AppStyles.styleBold13(context)
              .copyWith(color: const Color(0XFF0C0D0D)),
        ),
      ),
    );
  }
}
