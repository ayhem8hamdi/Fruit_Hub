import 'package:advanced_ecommerce/features/card_and_products_details/presentation/views/widgets/bottom_semi_circle_clipper.dart';
import 'package:flutter/material.dart';

class ProductClippedBackground extends StatelessWidget {
  const ProductClippedBackground({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: BottomSemiCircleClipper(),
      child: Container(
        color: const Color(0XFFF3F5F7),
        width: double.infinity,
      ),
    );
  }
}
