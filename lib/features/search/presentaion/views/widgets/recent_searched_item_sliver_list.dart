import 'package:advanced_ecommerce/features/search/presentaion/views/widgets/recent_searched_item.dart';
import 'package:flutter/material.dart';

class RecentSearchedItemSliverList extends StatelessWidget {
  const RecentSearchedItemSliverList({super.key});
  static final List<String> list = ['فراولة', 'تفاح', 'تفاح', 'تفاح'];
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: RecentSearchedItem(
            name: list[index],
          ),
        ),
        childCount: list.length,
      ),
    );
  }
}
