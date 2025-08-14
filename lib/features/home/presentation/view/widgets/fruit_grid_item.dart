import 'package:advanced_ecommerce/core/Utils/Router/app_router.dart';
import 'package:advanced_ecommerce/core/Utils/app_assets.dart';
import 'package:advanced_ecommerce/features/home/presentation/view/widgets/fruit_pricing_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class FruitGridItem extends StatelessWidget {
  const FruitGridItem({super.key, this.color});
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(AppRouter.productDetails),
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
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: SvgPicture.asset(Assets.ananasIcon),
                ),
              ),
              Positioned(
                top: 10,
                right: 9,
                child: color != null
                    ? Icon(Icons.favorite, size: 23, color: color)
                    : const Icon(Icons.favorite_border, size: 23),
              ),
              const Positioned(
                bottom: 16,
                left: 8.5,
                right: 7.5,
                child: FruitPricingRow(),
              ),
            ],
          )),
    );
  }
}
