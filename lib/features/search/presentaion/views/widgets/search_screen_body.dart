import 'package:advanced_ecommerce/core/Utils/app_styles.dart';
import 'package:advanced_ecommerce/features/home/presentation/view/widgets/active_custom_search_field.dart';
import 'package:advanced_ecommerce/features/home/presentation/view/widgets/custom_most_popular_product_appbar.dart';
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
          SearchScreenBodyLineTitles()
        ],
      ),
    );
  }
}

class SearchScreenBodyLineTitles extends StatelessWidget {
  const SearchScreenBodyLineTitles({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'عمليات البحث الأخيرة',
                style: AppStyles.styleBold13(context)
                    .copyWith(color: Colors.black),
              ),
              Text(
                'حذف الكل',
                style: AppStyles.styleRegular13(context)
                    .copyWith(color: const Color(0XFF949D9E)),
              )
            ],
          )),
    );
  }
}
