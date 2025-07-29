import 'package:advanced_ecommerce/features/card_and_products_details/presentation/views/widgets/selected_product_item_row.dart';
import 'package:flutter/material.dart';

class SelectedProductItem extends StatelessWidget {
  const SelectedProductItem({super.key, this.isItFirst = false});
  final bool isItFirst;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        isItFirst == true
            ? const Divider(
                height: 4.5,
                thickness: 0.45,
                color: Color(0xFFDDDFDF),
              )
            : const SizedBox.shrink(),
        const SelectedProductItemRow(),
        const Divider(
          height: 4.5,
          thickness: 0.45,
          color: Color(0xFFDDDFDF),
        ),
      ],
    );
  }
}
