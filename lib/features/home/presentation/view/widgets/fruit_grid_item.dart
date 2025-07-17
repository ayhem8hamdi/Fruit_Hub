import 'package:advanced_ecommerce/core/Utils/app_assets.dart';
import 'package:advanced_ecommerce/features/home/presentation/view/widgets/fruit_pricing_row.dart';
import 'package:flutter/material.dart';

class FruitGridItem extends StatelessWidget {
  const FruitGridItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: const Color(0XFFF3F5F7),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 10, right: 9, bottom: 5),
                child: Icon(Icons.favorite_border, size: 29),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17),
                child: SizedBox(
                  height: constraints.maxWidth * 0.5,
                  child: Center(
                    child: Image.asset(
                      Assets.fraisePng,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              const Spacer(),
              const Padding(
                padding:
                    EdgeInsets.only(right: 7.5, left: 8.5, bottom: 16, top: 9),
                child: FruitPricingRow(),
              )
            ],
          );
        },
      ),
    );
  }
}
