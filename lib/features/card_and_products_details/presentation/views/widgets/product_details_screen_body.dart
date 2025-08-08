import 'package:advanced_ecommerce/core/Utils/app_colors.dart';
import 'package:advanced_ecommerce/core/Utils/app_styles.dart';
import 'package:advanced_ecommerce/features/card_and_products_details/presentation/views/widgets/product_image_and_upper_section.dart';
import 'package:advanced_ecommerce/features/card_and_products_details/presentation/views/widgets/product_quantity_and_pricing_row.dart';
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
        RatingAndCommentsLinkRow()
      ],
    );
  }
}

class RatingAndCommentsLinkRow extends StatelessWidget {
  const RatingAndCommentsLinkRow({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            const Icon(
              Icons.star,
              color: Color(0XFFFFC529),
            ),
            const Gap(9),
            Text(
              '4.5',
              style: AppStyles.styleSemiBold13(context).copyWith(
                color: const Color(0XFF111719),
              ),
            ),
            const Gap(9),
            Text(
              '(30+)',
              style: AppStyles.styleRegular13(context)
                  .copyWith(color: const Color(0XFF9796A1)),
            ),
            const Gap(9),
            Text(
              'المراجعه',
              style: AppStyles.styleBold13(context).copyWith(
                color: AppColors.kPrimaryColor,
                decoration: TextDecoration.underline,
              ),
            )
          ],
        ),
      ),
    );
  }
}
