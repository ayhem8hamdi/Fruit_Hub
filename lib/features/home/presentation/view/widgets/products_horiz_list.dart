import 'package:advanced_ecommerce/features/home/presentation/view/widgets/horiz_list_fruit_item.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProductsHorizList extends StatelessWidget {
  const ProductsHorizList({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: ResponsiveHorizontalRowList(),
    );
  }
}

class ResponsiveHorizontalRowList extends StatelessWidget {
  const ResponsiveHorizontalRowList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Row(
            children: List.generate(10, (index) {
              return const Padding(
                padding: EdgeInsets.only(right: 9),
                child: HorizListFruitItem(),
              );
            }),
          ),
          const Gap(10),
        ],
      ),
    );
  }
}
