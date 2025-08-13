import 'package:advanced_ecommerce/core/Utils/app_assets.dart';
import 'package:advanced_ecommerce/core/Utils/app_colors.dart';
import 'package:advanced_ecommerce/core/Utils/app_styles.dart';
import 'package:advanced_ecommerce/core/Utils/methods_helper.dart';
import 'package:advanced_ecommerce/features/home/presentation/view/widgets/custom_box_shadow_container.dart';
import 'package:advanced_ecommerce/features/home/presentation/view/widgets/custom_reusable_bottom_sheet.dart';
import 'package:advanced_ecommerce/features/home/presentation/view/widgets/custom_search_bar_icon.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class InActiveCustomSearchTextField extends StatelessWidget {
  const InActiveCustomSearchTextField({
    super.key,
    required this.hintText,
    this.controller,
    this.validator,
  });

  final String hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: CustomBoxShadowContainer(
        widget: TextFormField(
          readOnly: true,
          showCursor: false,
          onTap: () {
            Navigator.of(context).pushNamed('/tab/home/searchScreen');
          },
          style: AppStyles.styleSemiBold16(context)
              .copyWith(color: const Color(0xFF0C0D0D)),
          decoration: InputDecoration(
            prefixIcon: const SearchBarCusromIcon(svgName: Assets.searchIcon),
            suffixIcon: const FilterSearchFieldIcon(),
            isDense: true,
            hintText: hintText,
            hintStyle: AppStyles.styleBold13(context),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
            filled: true,
            fillColor: Colors.white,
            hoverColor: Colors.transparent,
            focusColor: Colors.transparent,
            enabledBorder: MethodsHelper.whiteBorder(),
            focusedBorder: MethodsHelper.whiteBorder(),
            disabledBorder: MethodsHelper.whiteBorder(),
            errorBorder: MethodsHelper.whiteBorder(),
            focusedErrorBorder: MethodsHelper.whiteBorder(),
          ),
        ),
      ),
    );
  }
}

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
              widget: LabeledRangeSlider(),
            ),
          );
        });
  }
}

class LabeledRangeSlider extends StatefulWidget {
  const LabeledRangeSlider({super.key});

  @override
  LabeledRangeSliderState createState() => LabeledRangeSliderState();
}

class LabeledRangeSliderState extends State<LabeledRangeSlider> {
  RangeValues _values = const RangeValues(100, 300);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final sliderWidth = constraints.maxWidth - 50;
      // Calculate positions of thumbs on slider track:
      double startPos = (_values.start / 500) * sliderWidth;
      double endPos = (_values.end / 500) * sliderWidth;

      return Directionality(
        textDirection: TextDirection.ltr, // force LTR for slider
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                left: startPos,
                top: -11,
                child: Text(
                  r"$" + _values.start.round().toString(),
                  style: AppStyles.styleSemiBold13(context)
                      .copyWith(color: AppColors.kPrimaryColor),
                ),
              ),
              Positioned(
                left: endPos,
                top: -11,
                child: Text(
                  r"$" + _values.end.round().toString(),
                  style: AppStyles.styleSemiBold13(context)
                      .copyWith(color: AppColors.kPrimaryColor),
                ),
              ),
              // The slider itself:
              RangeSlider(
                min: 0,
                max: 500,
                values: _values,
                divisions: 500,
                onChanged: (newValues) {
                  setState(() {
                    _values = newValues;
                  });
                },
                overlayColor: WidgetStateProperty.all(Colors.transparent),
                activeColor: AppColors.kPrimaryColor,
                inactiveColor: const Color(0XFFEEEEEE),
              ),
            ],
          ),
        ),
      );
    });
  }
}
