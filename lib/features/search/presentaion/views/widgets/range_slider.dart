import 'package:advanced_ecommerce/core/Utils/app_colors.dart';
import 'package:advanced_ecommerce/core/Utils/app_styles.dart';
import 'package:advanced_ecommerce/features/OnBoarding/presentation/views/widgets/on_boarding_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class RangeSelectionForm extends StatefulWidget {
  const RangeSelectionForm({super.key});

  @override
  RangeSelectionFormState createState() => RangeSelectionFormState();
}

class RangeSelectionFormState extends State<RangeSelectionForm> {
  RangeValues _values = const RangeValues(100, 300);

  void _onRangeChanged(RangeValues newValues) {
    setState(() {
      _values = newValues;
    });
  }

  void _onApplyPressed() {
    Navigator.of(context).pop({
      'start': _values.start,
      'end': _values.end,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Gap(10),
        LabeledRangeSlider(
          values: _values,
          onChanged: _onRangeChanged,
        ),
        const SizedBox(height: 20),
        OnBoardingButton(
          padding: 9.5,
          raduis: 8,
          onTap: _onApplyPressed,
          text: 'تصفيه',
        ),
      ],
    );
  }
}

class LabeledRangeSlider extends StatelessWidget {
  final RangeValues values;
  final ValueChanged<RangeValues> onChanged;

  const LabeledRangeSlider({
    super.key,
    required this.values,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final sliderWidth = constraints.maxWidth - 50;
      double startPos = (values.start / 500) * sliderWidth;
      double endPos = (values.end / 500) * sliderWidth;

      return Directionality(
        textDirection: TextDirection.ltr,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                left: startPos,
                top: -11,
                child: Text(
                  r"$" + values.start.round().toString(),
                  style: AppStyles.styleSemiBold13(context)
                      .copyWith(color: AppColors.kPrimaryColor),
                ),
              ),
              Positioned(
                left: endPos,
                top: -11,
                child: Text(
                  r"$" + values.end.round().toString(),
                  style: AppStyles.styleSemiBold13(context)
                      .copyWith(color: AppColors.kPrimaryColor),
                ),
              ),
              RangeSlider(
                min: 0,
                max: 500,
                values: values,
                divisions: 500,
                onChanged: onChanged,
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
