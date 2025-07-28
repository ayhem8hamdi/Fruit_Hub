import 'package:advanced_ecommerce/core/Utils/app_colors.dart';
import 'package:advanced_ecommerce/core/Utils/app_styles.dart';
import 'package:flutter/material.dart';

class NumberOfSelectedProductsText extends StatelessWidget {
  const NumberOfSelectedProductsText({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        color: const Color(0XFFEBF9F1),
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Text(
          'لديك 3 منتجات في سله التسوق',
          style: AppStyles.styleRegular13(context)
              .copyWith(color: AppColors.kPrimaryColor, height: 1.6),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
