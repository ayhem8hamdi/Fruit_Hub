import 'package:advanced_ecommerce/core/Utils/app_styles.dart';
import 'package:flutter/material.dart';

class BestSellerTitlesLine extends StatelessWidget {
  const BestSellerTitlesLine({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 19),
        child: Row(
          children: [
            Text(
              'الأكثر مبيعًا',
              style:
                  AppStyles.styleBold16(context).copyWith(color: Colors.black),
            ),
            const Spacer(),
            Text(
              'المزيد',
              style: AppStyles.styleRegular13(context)
                  .copyWith(color: const Color(0XFF949D9E)),
            )
          ],
        ),
      ),
    );
  }
}
