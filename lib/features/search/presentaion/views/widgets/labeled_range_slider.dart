import 'package:advanced_ecommerce/core/Utils/app_colors.dart';
import 'package:advanced_ecommerce/core/Utils/app_styles.dart';
import 'package:flutter/material.dart';

class LabeledRangeSlider extends StatelessWidget {
  final RangeValues values;
  final double min;
  final double max;
  final ValueChanged<RangeValues> onChanged;

  const LabeledRangeSlider({
    super.key,
    required this.values,
    required this.min,
    required this.max,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final sliderWidth = constraints.maxWidth - 50;
        double startPos = (values.start / max) * sliderWidth;
        double endPos = (values.end / max) * sliderWidth;

        return Directionality(
          textDirection: TextDirection.ltr,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                // Start value label
                Positioned(
                  left: startPos,
                  top: -11,
                  child: Text(
                    "\$${values.start.round()}",
                    style: AppStyles.styleSemiBold13(context)
                        .copyWith(color: AppColors.kPrimaryColor),
                  ),
                ),
                // End value label
                Positioned(
                  left: endPos,
                  top: -11,
                  child: Text(
                    "\$${values.end.round()}",
                    style: AppStyles.styleSemiBold13(context)
                        .copyWith(color: AppColors.kPrimaryColor),
                  ),
                ),
                // Slider
                RangeSlider(
                  min: min,
                  max: max,
                  values: values,
                  divisions: (max - min).toInt(),
                  onChanged: onChanged,
                  overlayColor: WidgetStateProperty.all(Colors.transparent),
                  activeColor: AppColors.kPrimaryColor,
                  inactiveColor: const Color(0XFFEEEEEE),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
