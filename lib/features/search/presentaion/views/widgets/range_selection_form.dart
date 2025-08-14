import 'package:advanced_ecommerce/core/Utils/app_assets.dart';
import 'package:advanced_ecommerce/core/Utils/app_styles.dart';
import 'package:advanced_ecommerce/features/OnBoarding/presentation/views/widgets/on_boarding_button.dart';
import 'package:advanced_ecommerce/features/search/presentaion/views/widgets/labeled_range_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class RangeSelectionForm extends StatefulWidget {
  const RangeSelectionForm({super.key});

  @override
  State<RangeSelectionForm> createState() => _RangeSelectionFormState();
}

class _RangeSelectionFormState extends State<RangeSelectionForm> {
  RangeValues _values = const RangeValues(100, 300);

  void _onApplyPressed() {
    Navigator.of(context).pop({
      'start': _values.start,
      'end': _values.end,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const RangeSliderFormTitle(),
        const Gap(18),
        LabeledRangeSlider(
          values: _values,
          min: 0,
          max: 500,
          onChanged: (newValues) {
            setState(() => _values = newValues);
          },
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

class RangeSliderFormTitle extends StatelessWidget {
  const RangeSliderFormTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 9),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(Assets.pricingTagIcon),
          const Gap(8),
          Text(
            'السعر :',
            style: AppStyles.styleBold13(context)
                .copyWith(color: const Color(0XFF181001)),
          ),
        ],
      ),
    );
  }
}
