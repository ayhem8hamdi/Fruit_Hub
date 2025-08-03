import 'package:advanced_ecommerce/features/user_profile/presentation/views/widgets/order_item.dart';
import 'package:flutter/material.dart';

class ExpandableOrderItem extends StatefulWidget {
  const ExpandableOrderItem({super.key});

  @override
  State<ExpandableOrderItem> createState() => _ExpandableOrderItemState();
}

class _ExpandableOrderItemState extends State<ExpandableOrderItem> {
  bool _isExpanded = false;

  void _toggle() => setState(() => _isExpanded = !_isExpanded);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          OrderItem(
            isExpanded: _isExpanded,
            onArrowTap: _toggle,
          ),
          AnimatedCrossFade(
            firstChild: const SizedBox.shrink(),
            secondChild: const OrderDetails(),
            crossFadeState: _isExpanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 300),
          ),
        ],
      ),
    );
  }
}

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      color: const Color(0XFFF2F3F3).withOpacity(0.4),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(
            thickness: 0.6,
            color: Color(0xFFDDDFDF),
          ),
          Padding(
            padding: EdgeInsets.only(top: 8, bottom: 8, right: 9),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [],
            ),
          ),
        ],
      ),
    );
  }
}
