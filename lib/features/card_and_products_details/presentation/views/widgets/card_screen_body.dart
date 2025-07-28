import 'package:advanced_ecommerce/core/Utils/app_assets.dart';
import 'package:advanced_ecommerce/core/Utils/app_styles.dart';
import 'package:advanced_ecommerce/core/Utils/responsive_image.dart';
import 'package:advanced_ecommerce/features/card_and_products_details/presentation/views/widgets/custom_card_appbar.dart';
import 'package:advanced_ecommerce/features/card_and_products_details/presentation/views/widgets/number_of_selected_products.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CardScreenBody extends StatelessWidget {
  const CardScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: CustomScrollView(
        slivers: [
          CustomCardAppBar(),
          SliverGap(16),
          NumberOfSelectedProductsText(),
          SliverGap(24),
          SelectedProductItem(),
        ],
      ),
    );
  }
}

class SelectedProductItem extends StatelessWidget {
  const SelectedProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(
            height: 4.5,
            thickness: 0.45,
            color: Color(0xFFDDDFDF),
          ),
          SelectedProductItemRow(),
          Divider(
            height: 4.5,
            thickness: 0.45,
            color: Color(0xFFDDDFDF),
          ),
        ],
      ),
    );
  }
}

class SelectedProductItemRow extends StatelessWidget {
  const SelectedProductItemRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ResponsiveImage(
              imageDesignWidth: 77,
              screenDesignWidth: 375,
              imageDesignAspectRatio: 73 / 92,
              imageProvider: AssetImage(Assets.waterMelonImage),
            ),
            QuantityAndProductNameColumn(),
            const Spacer(),
            PricingAndDeletingColumn(),
          ],
        ),
      ),
    );
  }
}

class QuantityAndProductNameColumn extends StatelessWidget {
  const QuantityAndProductNameColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 17),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gap(6),
          Text(
            'بطيخ',
            style: AppStyles.styleBold13(context)
                .copyWith(color: const Color(0XFF06161C)),
          ),
          const Gap(4),
          Text(
            '3 كم',
            style: AppStyles.styleRegular13(context)
                .copyWith(color: const Color(0XFFF4A91F)),
          ),
          const Spacer(),
          ProductQuantitySection(),
          Gap(6)
        ],
      ),
    );
  }
}

class ProductQuantitySection extends StatelessWidget {
  const ProductQuantitySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(Assets.addProductIcon),
        const Gap(16),
        Text(
          '3',
          style: AppStyles.styleBold16(context).copyWith(color: Colors.black),
        ),
        const Gap(16),
        Image.asset(Assets.removeProductIcon),
      ],
    );
  }
}

class PricingAndDeletingColumn extends StatelessWidget {
  const PricingAndDeletingColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Image.asset(Assets.deleteProductIcon),
          Text(
            '60 جنيه ',
            style: AppStyles.styleBold16(context).copyWith(
              color: const Color(0XFFF4A91F),
            ),
          ),
        ],
      ),
    );
  }
}
