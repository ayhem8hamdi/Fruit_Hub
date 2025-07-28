import 'package:flutter/material.dart';

class ResponsiveHorizListHeight extends StatelessWidget {
  final Widget child;
  final double designHeight;
  final double designScreenWidth;
  final double? minHeight;
  final double? maxHeight;

  const ResponsiveHorizListHeight({
    super.key,
    required this.child,
    required this.designHeight,
    required this.designScreenWidth,
    this.minHeight,
    this.maxHeight,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final responsiveHeight = (designHeight / designScreenWidth) * screenWidth;

    final clampedHeight = responsiveHeight.clamp(
      minHeight ?? designHeight * 0.8,
      maxHeight ?? designHeight * 1.3,
    );

    return SizedBox(
      height: clampedHeight,
      child: child,
    );
  }
}
