import 'package:flutter/material.dart';

class CustomBoxShadowContainer extends StatelessWidget {
  const CustomBoxShadowContainer({super.key, required this.widget});
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(3),
          boxShadow: const [
            BoxShadow(
              color: Color(0x05000000), // 10% black
              blurRadius: 4,
              offset: Offset(0, 2), // subtle downward shadow
              spreadRadius: 1,
            ),
            BoxShadow(
              color: Color(0x05000000), // lighter outer glow
              blurRadius: 3,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: widget);
  }
}
