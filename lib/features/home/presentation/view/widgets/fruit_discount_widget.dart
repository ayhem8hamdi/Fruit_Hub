import 'package:advanced_ecommerce/core/Utils/app_assets.dart';
import 'package:advanced_ecommerce/features/home/presentation/view/widgets/custom_curved_container.dart';
import 'package:flutter/material.dart';

class FruitDiscountWidget extends StatelessWidget {
  const FruitDiscountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: AspectRatio(
        aspectRatio: 342 / 158,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                Assets.fruits,
                fit: BoxFit.cover,
              ),
              const Align(
                alignment: Alignment.centerRight,
                child: CustomCurvedContainer(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
