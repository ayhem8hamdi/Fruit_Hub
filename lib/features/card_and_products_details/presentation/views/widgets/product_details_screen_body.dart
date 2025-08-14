import 'package:advanced_ecommerce/features/OnBoarding/presentation/views/widgets/on_boarding_button.dart';
import 'package:advanced_ecommerce/features/card_and_products_details/presentation/views/widgets/product_description_text.dart';
import 'package:advanced_ecommerce/features/card_and_products_details/presentation/views/widgets/product_features.dart';
import 'package:advanced_ecommerce/features/card_and_products_details/presentation/views/widgets/product_image_and_upper_section.dart';
import 'package:advanced_ecommerce/features/card_and_products_details/presentation/views/widgets/product_quantity_and_pricing_row.dart';
import 'package:advanced_ecommerce/features/card_and_products_details/presentation/views/widgets/rating_and_comments_link_row.dart';
import 'package:advanced_ecommerce/features/home/data/models/fruit_model.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProductDetailsScreenBody extends StatelessWidget {
  const ProductDetailsScreenBody({super.key, required this.fruitModel});
  final FruitModel fruitModel;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        ProductImageAndUpperSection(
          imageLink: fruitModel.imagelink,
        ),
        const SliverGap(24),
        ProductQuantityAndPriceRow(
          fruitModel: fruitModel,
        ),
        const SliverGap(9),
        RatingAndCommentsLinkRow(),
        SliverGap(9),
        ProductDescriptionText(),
        SliverGap(17),
        ProductFeatures(),
        SliverGap(20),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(left: 18, right: 18, bottom: 30),
            child: OnBoardingButton(
              text: 'أضف الي السلة',
            ),
          ),
        ),
      ],
    );
  }
}
