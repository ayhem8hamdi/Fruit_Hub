import 'package:flutter/material.dart';

class BottomSheetBody extends StatelessWidget {
  const BottomSheetBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [],
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
    return RadioListTile<String>(
      title: Text(option),
      value: option,
      groupValue: groupValue,
      onChanged: onChanged,
    );
  }
}
