import 'package:advanced_ecommerce/core/Utils/app_assets.dart';
import 'package:advanced_ecommerce/features/card_and_products_details/presentation/views/widgets/product_clipped_background.dart';
import 'package:advanced_ecommerce/features/card_and_products_details/presentation/views/widgets/product_details_screen_custom_app_bar.dart';
import 'package:flutter/material.dart';

class ProductImageAndUpperSection extends StatelessWidget {
  const ProductImageAndUpperSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.48,
        child: Stack(
          children: [
            const ProductClippedBackground(),
            Center(
              child: Image.asset(
                Assets.fraisePng,
                fit: BoxFit.contain,
                width: MediaQuery.sizeOf(context).width * 0.50,
              ),
            ),
            const Positioned(
              top: 0,
              right: 0,
              child: ProductDetailsCustomAppBar(),
            ),
          ],
        ),
      ),
    );
  }
}
