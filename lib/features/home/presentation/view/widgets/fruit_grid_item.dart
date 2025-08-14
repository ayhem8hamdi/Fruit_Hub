import 'package:advanced_ecommerce/core/Utils/Router/app_router.dart';
import 'package:advanced_ecommerce/core/Utils/hero_controller.dart';
import 'package:advanced_ecommerce/features/home/data/models/fruit_model.dart';
import 'package:advanced_ecommerce/features/home/presentation/view/widgets/favourite_icon.dart';
import 'package:advanced_ecommerce/features/home/presentation/view/widgets/fruit_pricing_row.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FruitGridItem extends StatelessWidget {
  const FruitGridItem({super.key, this.color, required this.fruitModel});
  final Color? color;
  final FruitModel fruitModel;

  @override
  Widget build(BuildContext context) {
    final heroTag =
        GetHeroController.to.getUniqueHeroTag('product-${fruitModel.id}');

    return GestureDetector(
      onTap: () => Get.toNamed(
        AppRouter.productDetails,
        arguments: {
          'fruitModel': fruitModel,
          'heroTag': heroTag,
        },
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: const Color(0XFFF3F5F7),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 35,
              bottom: 60,
              left: 17,
              right: 17,
              child: Hero(
                tag: heroTag,
                child: Material(
                  color: Colors.transparent,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(bottom: 17, right: 10, left: 10),
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: Image.asset(fruitModel.imagelink),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
                top: 10,
                right: 9,
                child: color == null
                    ? const FavouriteIcon()
                    : const Icon(Icons.favorite, color: Colors.red)),
            Positioned(
              bottom: 16,
              left: 8.5,
              right: 7.5,
              child: FruitPricingRow(
                fruitModel: fruitModel,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
