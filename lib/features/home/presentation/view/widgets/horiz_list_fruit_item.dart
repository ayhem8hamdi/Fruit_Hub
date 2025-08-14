import 'package:advanced_ecommerce/core/Utils/app_styles.dart';
import 'package:advanced_ecommerce/core/Utils/responsive_image.dart';
import 'package:advanced_ecommerce/features/home/data/models/fruit_model.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HorizListFruitItem extends StatelessWidget {
  const HorizListFruitItem({
    super.key,
    required this.fruitModel,
  });
  final FruitModel fruitModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ResponsiveImage(
          imageDesignWidth: 64,
          screenDesignWidth: 375,
          imageDesignAspectRatio: 1,
          customImageWidget: Image.asset(fruitModel.imagelink),
        ),
        const Gap(2),
        Text(
          fruitModel.productName,
          style: AppStyles.styleBold13(context)
              .copyWith(color: Colors.black, height: 1.7),
        )
      ],
    );
  }
}
