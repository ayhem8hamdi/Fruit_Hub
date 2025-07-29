import 'package:advanced_ecommerce/features/card_and_products_details/presentation/views/widgets/selected_product_item.dart';
import 'package:flutter/material.dart';

class SelectedcardItemsList extends StatelessWidget {
  const SelectedcardItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return index == 0
              ? const SelectedProductItem(
                  isItFirst: true,
                )
              : const SelectedProductItem();
        },
        childCount: 3,
      ),
    );
  }
}
