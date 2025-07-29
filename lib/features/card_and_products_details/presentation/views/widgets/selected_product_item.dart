import 'package:advanced_ecommerce/features/card_and_products_details/presentation/views/widgets/selected_product_item_row.dart';
import 'package:flutter/material.dart';

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
