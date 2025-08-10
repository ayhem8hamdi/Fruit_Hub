import 'package:advanced_ecommerce/core/Utils/app_assets.dart';
import 'package:advanced_ecommerce/features/card_and_products_details/data/product_feature_model.dart';
import 'package:advanced_ecommerce/features/card_and_products_details/presentation/views/widgets/product_feature_items.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProductFeatures extends StatelessWidget {
  const ProductFeatures({super.key});
  static final List<ProductFeatureModel> list1 = [
    ProductFeatureModel(
        title: 'الصلاحيه', value: 'عام', icon: Assets.calendarIcon),
    ProductFeatureModel(
        title: 'اوجانيك', value: '100%', icon: Assets.organicIcon),
    ProductFeatureModel(
        title: '100 جرام', value: '80 كالوري', icon: Assets.calorieIcon),
    ProductFeatureModel(
        title: 'Reviews', value: '(12) 4.8', icon: Assets.starIcon)
  ];

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: ProductFeatureItem(productFeatureModel: list1[0])),
                const Gap(16),
                Expanded(
                    child: ProductFeatureItem(productFeatureModel: list1[1])),
              ],
            ),
            const Gap(16),
            Row(
              children: [
                Expanded(
                    child: ProductFeatureItem(productFeatureModel: list1[2])),
                const Gap(16),
                Expanded(
                    child: ProductFeatureItem(
                  productFeatureModel: list1[3],
                  index: 3,
                )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
