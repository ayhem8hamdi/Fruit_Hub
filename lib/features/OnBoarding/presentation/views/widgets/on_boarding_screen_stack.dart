import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class StackFruitImage extends StatelessWidget {
  const StackFruitImage({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SvgPicture.asset(
        image,
        fit: BoxFit.none,
      ),
    );
  }
}

class StackBgColor extends StatelessWidget {
  const StackBgColor({
    super.key,
    required this.bgImage,
    required this.color,
  });

  final String bgImage;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      bgImage,
      color: color,
      fit: BoxFit.fill,
      width: double.infinity,
    );
  }
}
