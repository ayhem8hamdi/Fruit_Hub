import 'package:advanced_ecommerce/core/Utils/app_styles.dart';
import 'package:flutter/material.dart';

class ProductDescriptionText extends StatelessWidget {
  const ProductDescriptionText({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17),
        child: Text(
          'ينتمي إلى الفصيلة القرعية ولثمرته لُب حلو المذاق وقابل للأكل، وبحسب علم النبات فهي تعتبر ثمار لبيّة، تستعمل لفظة البطيخ للإشارة إلى النبات نفسه أو إلى الثمرة تحديداً',
          style: AppStyles.styleRegular13(context).copyWith(
            height: 1.6,
            color: const Color(0XFF979899),
          ),
        ),
      ),
    );
  }
}
