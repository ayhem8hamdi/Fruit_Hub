import 'package:advanced_ecommerce/core/Utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class ToggleButton extends StatefulWidget {
  const ToggleButton({super.key});

  @override
  State<ToggleButton> createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<ToggleButton> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()..scale(-1.0, 1.0),
      child: FlutterSwitch(
        width: 44.0,
        height: 24.0,
        toggleSize: 20.0,
        value: isSwitched,
        borderRadius: 20.0,
        padding: 2.0,
        activeColor: AppColors.kPrimaryColor,
        inactiveColor: const Color(0xFFC4C7D0),
        toggleColor: Colors.white,
        showOnOff: false,
        onToggle: (val) {
          setState(() {
            isSwitched = val;
          });
        },
      ),
    );
  }
}
