import 'package:advanced_ecommerce/features/home/presentation/view/widgets/custom_most_popular_product_appbar.dart';
import 'package:advanced_ecommerce/features/home/presentation/view/widgets/fruit_item_grid_delegate_builder.dart';
import 'package:advanced_ecommerce/features/home/presentation/view/widgets/most_Popular_Product_Title.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';

class MostPopularProductScreenBody extends StatelessWidget {
  const MostPopularProductScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: CustomScrollView(
        slivers: [
          CustomMostPopularProductAppbar(
            title: 'الأكثر مبيعًا',
          ),
          SliverGap(24),
          MostPopularProductTitle(),
          SliverGap(14),
          FruitItemGridDelegateBuilder(),
          SliverGap(14)
        ],
      ),
    );
  }
}
