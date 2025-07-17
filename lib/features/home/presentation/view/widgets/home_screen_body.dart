import 'package:advanced_ecommerce/core/Utils/app_assets.dart';
import 'package:advanced_ecommerce/core/Utils/app_styles.dart';
import 'package:advanced_ecommerce/features/home/presentation/view/widgets/best_seller_titles_line.dart';
import 'package:advanced_ecommerce/features/home/presentation/view/widgets/custom_search_text_field.dart';
import 'package:advanced_ecommerce/features/home/presentation/view/widgets/fruit_discount_widget.dart';
import 'package:advanced_ecommerce/features/home/presentation/view/widgets/home_screen_user_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: HomeScreenUserListTile(),
        ),
        SliverGap(16),
        SliverToBoxAdapter(
          child: CustomSearchTextField(hintText: 'ابحث عن.......'),
        ),
        SliverGap(12),
        SliverToBoxAdapter(
          child: FruitDiscountWidget(),
        ),
        SliverGap(14),
        SliverToBoxAdapter(
          child: BestSellerTitlesLine(),
        ),
        SliverGap(12),
        FruitItemGridDelegateBuilder(),
      ],
    );
  }
}

class FruitItemGridDelegateBuilder extends StatelessWidget {
  const FruitItemGridDelegateBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 16,
          childAspectRatio: 163 / 214,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) => const FruitGridItem(),
          childCount: 20,
        ),
      ),
    );
  }
}

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
                child: Icon(Icons.favorite_border, size: 20),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17),
                child: SizedBox(
                  height: constraints.maxWidth * 0.5, // Responsive image height
                  child: Center(
                    child: Image.asset(
                      Assets.fraisePng,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              const Spacer(), // Takes available space
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

class FruitPricingRow extends StatelessWidget {
  const FruitPricingRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'فراولة',
              style: AppStyles.styleSemiBold13(context)
                  .copyWith(color: Colors.black),
            ),
            const Gap(6),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                      text: '30 جنية',
                      style: AppStyles.styleBold13(context)
                          .copyWith(color: const Color(0XFFF4A91F))),
                  TextSpan(
                      text: ' / الكيلو',
                      style: AppStyles.styleSemiBold13(context)
                          .copyWith(color: const Color(0XFFF8C76D))),
                ],
              ),
            )
          ],
        ),
        const Spacer(),
        Image.asset(Assets.addIcon)
      ],
    );
  }
}
