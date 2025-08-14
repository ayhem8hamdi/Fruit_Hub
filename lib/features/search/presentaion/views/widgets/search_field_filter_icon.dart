import 'package:advanced_ecommerce/core/Utils/app_assets.dart';
import 'package:advanced_ecommerce/features/home/presentation/view/widgets/custom_reusable_bottom_sheet.dart';
import 'package:advanced_ecommerce/features/home/presentation/view/widgets/custom_search_bar_icon.dart';
import 'package:advanced_ecommerce/features/search/presentaion/views/widgets/labeled_range_slider.dart';
import 'package:advanced_ecommerce/features/search/presentaion/views/widgets/range_selection_form.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class FilterSearchFieldIcon extends StatelessWidget {
  const FilterSearchFieldIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: const SearchBarCusromIcon(svgName: Assets.filterIcon),
        onTap: () {
          showCupertinoModalBottomSheet(
            context: context,
            useRootNavigator: true,
            expand: false,
            barrierColor: Colors.black.withOpacity(0.3),
            backgroundColor: Colors.transparent,
            builder: (context) => const PurchaseBottomSheet(
              title: "تصنيف حسب :",
              widget: RangeSelectionForm(),
            ),
          );
        });
  }
}
