import 'package:flutter/material.dart';

class CustomInActiveRadioCircle extends StatelessWidget {
  const CustomInActiveRadioCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9999),
            border: Border.all(
              width: 1,
              color: const Color(0XFF949D9E),
            )),
      ),
    );
  }
}
