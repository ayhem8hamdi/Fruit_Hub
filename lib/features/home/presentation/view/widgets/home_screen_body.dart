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
    return const Column(
      children: [
        HomeScreenUserListTile(),
        Gap(16),
        CustomSearchTextField(hintText: 'ابحث عن.......'),
        Gap(12),
        FruitDiscountWidget(),
        Gap(14),
        BestSellerTitlesLine()
      ],
    );
  }
}
