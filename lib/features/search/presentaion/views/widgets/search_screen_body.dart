import 'package:advanced_ecommerce/features/search/presentaion/views/widgets/active_custom_search_field.dart';
import 'package:advanced_ecommerce/features/home/presentation/view/widgets/custom_most_popular_product_appbar.dart';
import 'package:advanced_ecommerce/features/search/presentaion/views/widgets/recent_searched_item_sliver_list.dart';
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
