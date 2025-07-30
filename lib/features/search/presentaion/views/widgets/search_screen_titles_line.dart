import 'package:advanced_ecommerce/core/Utils/app_styles.dart';
import 'package:flutter/material.dart';

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
