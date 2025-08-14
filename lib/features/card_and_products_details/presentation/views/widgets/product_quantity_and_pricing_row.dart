import 'package:advanced_ecommerce/core/Utils/app_styles.dart';
import 'package:advanced_ecommerce/features/card_and_products_details/presentation/views/widgets/product_quantity.dart';
import 'package:advanced_ecommerce/features/home/data/models/fruit_model.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProductQuantityAndPriceRow extends StatelessWidget {
  const ProductQuantityAndPriceRow({super.key, required this.fruitModel});
  final FruitModel fruitModel;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ProductNameAndPricingWidget(
              fruitModel: fruitModel,
            ),
            const Spacer(),
            const QuantityWidget()
          ],
        ),
      ),
    );
  }
}

class ProductNameAndPricingWidget extends StatelessWidget {
  const ProductNameAndPricingWidget({
    super.key,
    required this.fruitModel,
  });
  final FruitModel fruitModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          fruitModel.productName,
          style: AppStyles.styleBold16(context)
              .copyWith(color: const Color(0XFF0C0D0D)),
        ),
        const Gap(8),
        Text.rich(
          TextSpan(children: [
            TextSpan(
                text: "${fruitModel.price} /",
                style: AppStyles.styleBold13(context)
                    .copyWith(color: const Color(0XFFF4A91E))),
            TextSpan(
                text: " الكيلو",
                style: AppStyles.styleSemiBold13(context)
                    .copyWith(color: const Color(0XFFF8C76D))),
          ]),
        )
      ],
    );
  }
}
