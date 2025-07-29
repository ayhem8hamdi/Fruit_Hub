import 'package:advanced_ecommerce/core/Utils/app_styles.dart';
import 'package:advanced_ecommerce/features/card_and_products_details/presentation/views/widgets/product_quantity_section.dart';
import 'package:flutter/material.dart';

class QuantityAndProductNameColumn extends StatelessWidget {
  const QuantityAndProductNameColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 14, top: 7, bottom: 7),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'بطيخ',
              style: AppStyles.styleBold13(context)
                  .copyWith(color: const Color(0XFF06161C)),
            ),
            Text(
              '3 كم',
              style: AppStyles.styleRegular13(context)
                  .copyWith(color: const Color(0XFFF4A91F)),
            ),
            const ProductQuantitySection(),
          ],
        ),
      ),
    );
  }
}
