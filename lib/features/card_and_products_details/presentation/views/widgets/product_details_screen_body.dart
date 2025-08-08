import 'package:advanced_ecommerce/features/card_and_products_details/presentation/views/widgets/product_description_text.dart';
import 'package:advanced_ecommerce/features/card_and_products_details/presentation/views/widgets/product_features.dart';
import 'package:advanced_ecommerce/features/card_and_products_details/presentation/views/widgets/product_image_and_upper_section.dart';
import 'package:advanced_ecommerce/features/card_and_products_details/presentation/views/widgets/product_quantity_and_pricing_row.dart';
import 'package:advanced_ecommerce/features/card_and_products_details/presentation/views/widgets/rating_and_comments_link_row.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProductDetailsScreenBody extends StatelessWidget {
  const ProductDetailsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        ProductImageAndUpperSection(),
        SliverGap(24),
        ProductQuantityAndPriceRow(),
        SliverGap(9),
        RatingAndCommentsLinkRow(),
        SliverGap(9),
        ProductDescriptionText(),
        SliverGap(17),
        ProductFeatures()
      ],
    );
  }
}
