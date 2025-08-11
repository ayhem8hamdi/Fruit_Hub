import 'dart:developer';

import 'package:advanced_ecommerce/core/Utils/app_colors.dart';
import 'package:advanced_ecommerce/core/Utils/app_styles.dart';
import 'package:advanced_ecommerce/core/Utils/ui_errors_handler.dart';
import 'package:advanced_ecommerce/features/OnBoarding/presentation/views/widgets/on_boarding_button.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BottomSheetBody extends StatefulWidget {
  final String? initialSelection;

  const BottomSheetBody({this.initialSelection, super.key});

  @override
  _BottomSheetBodyState createState() => _BottomSheetBodyState();
}

class _BottomSheetBodyState extends State<BottomSheetBody> {
  String? _selectedOption;

  @override
  void initState() {
    super.initState();
    _selectedOption = widget.initialSelection;
  }

  void _onOptionChanged(String? val) {
    setState(() {
      _selectedOption = val;
    });
  }

  final List<String> sortOptions = [
    'السعر ( الأقل الي الأعلي )',
    'السعر ( الأعلي الي الأقل )',
    'الأبجديه',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...sortOptions.map(
          (option) => SortByRadioItem(
            option: option,
            groupValue: _selectedOption,
            onChanged: _onOptionChanged,
          ),
        ),
        const Gap(11),
        OnBoardingButton(
          raduis: 8,
          padding: 9.5,
          text: 'تصفيه',
          onTap: () {
            if (_selectedOption != null) {
              Navigator.of(context, rootNavigator: true).pop(_selectedOption);
              log('Popped with: $_selectedOption');
              // i could get the value from the first call of this widget
            } else {
              UiHandler.showFlushBar(context, "choose a sort option",
                  flushbarPosition: FlushbarPosition.TOP);
            }
          },
        )
      ],
    );
  }
}

class SortByRadioItem extends StatelessWidget {
  final String option;
  final String? groupValue;
  final ValueChanged<String?> onChanged;

  const SortByRadioItem({
    required this.option,
    required this.groupValue,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: InkWell(
        onTap: () {
          onChanged(option);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Radio<String>(
              fillColor: WidgetStateProperty.resolveWith<Color?>(
                (states) {
                  if (states.contains(WidgetState.selected)) {
                    return AppColors.kPrimaryColor;
                  }
                  return const Color(0XFF949D9E);
                },
              ),
              value: option,
              groupValue: groupValue,
              onChanged: onChanged,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Text(
                option,
                style: AppStyles.styleBold13(context)
                    .copyWith(color: const Color(0XFF0C0D0D)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
