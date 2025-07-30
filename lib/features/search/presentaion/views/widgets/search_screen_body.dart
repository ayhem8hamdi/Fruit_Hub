import 'package:advanced_ecommerce/features/search/presentaion/views/widgets/active_custom_search_field.dart';
import 'package:advanced_ecommerce/features/home/presentation/view/widgets/custom_most_popular_product_appbar.dart';
import 'package:advanced_ecommerce/features/search/presentaion/views/widgets/recent_searched_item.dart';
import 'package:advanced_ecommerce/features/search/presentaion/views/widgets/search_screen_titles_line.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SearchScreenBody extends StatelessWidget {
  const SearchScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: CustomScrollView(
        slivers: [
          CustomMostPopularProductAppbar(
            title: 'البحث',
          ),
          SliverGap(24),
          ActiveCustomSearchTextField(hintText: 'ابحث عن.......'),
          SliverGap(26),
          SearchScreenBodyLineTitles(),
          SliverGap(16),
          RecentSearchedItemSliverList()
        ],
      ),
    );
  }
}

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
