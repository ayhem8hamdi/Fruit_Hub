import 'package:advanced_ecommerce/core/Utils/app_assets.dart';
import 'package:advanced_ecommerce/features/home/presentation/view/widgets/best_seller_titles_line.dart';
import 'package:advanced_ecommerce/features/home/presentation/view/widgets/custom_most_popular_product_appbar.dart';
import 'package:advanced_ecommerce/features/home/presentation/view/widgets/custom_search_text_field.dart';
import 'package:advanced_ecommerce/features/home/presentation/view/widgets/fruit_item_grid_delegate_builder.dart';
import 'package:advanced_ecommerce/features/home/presentation/view/widgets/products_and_sorting_line.dart';
import 'package:advanced_ecommerce/features/home/presentation/view/widgets/products_horiz_list.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProductsScreenBody extends StatelessWidget {
  const ProductsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: CustomScrollView(
        slivers: [
          CustomMostPopularProductAppbar(
            title: 'المنتجات',
            isBackArrowHidden: true,
          ),
          SliverGap(16),
          CustomSearchTextField(hintText: 'ابحث عن.......'),
          SliverGap(16),
          OurProductsTitleAndSortingIconLine(
              text: 'منتجاتنا', image: Assets.trierIcon),
          SliverGap(10),
          ProductsHorizList(),
          SliverGap(26),
          BestSellerTitlesLine(),
          SliverGap(10),
          FruitItemGridDelegateBuilder()
        ],
      ),
    );
  }
}
