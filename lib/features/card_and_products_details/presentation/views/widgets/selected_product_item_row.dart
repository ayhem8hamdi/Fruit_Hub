import 'package:advanced_ecommerce/core/Utils/app_assets.dart';
import 'package:advanced_ecommerce/core/Utils/responsive_image.dart';
import 'package:advanced_ecommerce/features/card_and_products_details/presentation/views/widgets/product_pricing_and_deleting_column.dart';
import 'package:advanced_ecommerce/features/card_and_products_details/presentation/views/widgets/quantity_and_product_name_column.dart';
import 'package:flutter/material.dart';

class SelectedProductItemRow extends StatelessWidget {
  const SelectedProductItemRow({super.key});

  @override
  Widget build(BuildContext context) {
    final rowHeight = ResponsiveImage.getTotalHeight(
      context: context,
      imageDesignWidth: 77,
      screenDesignWidth: 375,
      imageDesignAspectRatio: 73 / 92,
    );

    return Padding(
      padding: const EdgeInsets.only(right: 12, left: 19),
      child: SizedBox(
        height: rowHeight,
        child: const Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ResponsiveImage(
              imageDesignWidth: 84,
              screenDesignWidth: 375,
              imageDesignAspectRatio: 73 / 92,
              imageProvider: AssetImage(Assets.waterMelonImage),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  QuantityAndProductNameColumn(),
                  Spacer(),
                  PricingAndDeletingColumn(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
