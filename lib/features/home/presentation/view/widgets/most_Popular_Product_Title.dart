import 'package:advanced_ecommerce/core/Utils/app_styles.dart';
import 'package:flutter/material.dart';

class MostPopularProductTitle extends StatelessWidget {
  const MostPopularProductTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 19),
        child: Text(
          'الأكثر مبيعًا',
          style: AppStyles.styleBold16(context).copyWith(color: Colors.black),
        ),
      ),
    );
  }
}
