import 'package:advanced_ecommerce/features/card_and_products_details/presentation/views/widgets/custom_card_appbar.dart';
import 'package:advanced_ecommerce/features/home/presentation/view/widgets/fruit_item_grid_delegate_builder.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class FavouriteItemsScreenBody extends StatelessWidget {
  const FavouriteItemsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: CustomScrollView(
        slivers: [
          CustomCardAppBar(
            title: 'المفضلة',
          ),
          SliverGap(16),
          FruitItemGridDelegateBuilder(
            childCount: 4,
            color: Colors.red,
          )
        ],
      ),
    );
  }
}
