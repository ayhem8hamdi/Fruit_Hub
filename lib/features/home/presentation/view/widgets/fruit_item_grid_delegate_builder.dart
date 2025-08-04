import 'package:advanced_ecommerce/features/home/presentation/view/widgets/fruit_grid_item.dart';
import 'package:flutter/material.dart';

class FruitItemGridDelegateBuilder extends StatelessWidget {
  const FruitItemGridDelegateBuilder(
      {super.key, this.childCount = 20, this.color});
  final int childCount;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 163 / 214,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) => FruitGridItem(
            color: color,
          ),
          childCount: childCount,
        ),
      ),
    );
  }
}
