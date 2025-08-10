import 'package:advanced_ecommerce/core/Utils/app_styles.dart';
import 'package:advanced_ecommerce/features/card_and_products_details/data/product_feature_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class ProductFeatureItem extends StatelessWidget {
  const ProductFeatureItem(
      {super.key, required this.productFeatureModel, this.index});
  final ProductFeatureModel productFeatureModel;
  final int? index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0XFF979899).withOpacity(0.25)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              index == 3
                  ? Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '(124) ',
                            style: AppStyles.styleBold13(context)
                                .copyWith(color: const Color(0XFF979899)),
                          ),
                          TextSpan(
                            text: '4.8',
                            style: AppStyles.styleBold16(context)
                                .copyWith(color: const Color(0XFF23AA49)),
                          ),
                        ],
                      ),
                    )
                  : Text(
                      productFeatureModel.value,
                      style: AppStyles.styleBold16(context)
                          .copyWith(color: const Color(0XFF23AA49)),
                    ),
              const Gap(8),
              Text(
                productFeatureModel.title,
                style: AppStyles.styleSemiBold13(context)
                    .copyWith(color: const Color(0XFF979899)),
              )
            ],
          ),
          const Gap(16),
          SvgPicture.asset(productFeatureModel.icon)
        ],
      ),
    );
  }
}
