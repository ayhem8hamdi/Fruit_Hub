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
    return const SingleChildScrollView(
      child: Column(
        children: [
          HomeScreenUserListTile(),
          Gap(16),
          CustomSearchTextField(hintText: 'ابحث عن.......'),
          Gap(12),
          FruitDiscountWidget(),
          Gap(14),
          BestSellerTitlesLine(),
          Gap(12),
          FruitsGridView(
            itemCount: 20,
          )
        ],
      ),
    );
  }
}

class FruitsGridView extends StatelessWidget {
  final int itemCount;

  const FruitsGridView({
    super.key,
    required this.itemCount,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8, // Vertical gap
        crossAxisSpacing: 16, // Horizontal gap
        childAspectRatio: 163 / 214, // Width/Height ratio
      ),
      itemCount: itemCount,
      itemBuilder: (context, index) {
        return const FruitGridItem();
      },
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
