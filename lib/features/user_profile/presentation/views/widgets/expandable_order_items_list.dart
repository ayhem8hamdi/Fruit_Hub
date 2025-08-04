import 'package:advanced_ecommerce/features/user_profile/presentation/views/widgets/expandable_order_item.dart';
import 'package:flutter/material.dart';

class ExpandableOrderItemsList extends StatelessWidget {
  const ExpandableOrderItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: List.generate(
            3,
            (index) => const Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: ExpandableOrderItem(),
                )),
      ),
    );
  }
}
