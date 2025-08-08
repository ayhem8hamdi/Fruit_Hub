import 'package:advanced_ecommerce/core/Utils/app_assets.dart';
import 'package:advanced_ecommerce/features/card_and_products_details/presentation/views/widgets/product_clipped_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProductDetailsScreenBody extends StatelessWidget {
  const ProductDetailsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Stack(
            children: [
              const ProductClippedBackground(),
              Positioned(
                  top: 0,
                  right: 0,
                  child: SafeArea(
                      child: Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: SvgPicture.asset(Assets.arrowBackIcon),
                  )))
            ],
          ),
        )
      ],
    );
  }
}
