import 'package:advanced_ecommerce/features/OnBoarding/presentation/views/widgets/on_boarding_screen_stack.dart';
import 'package:advanced_ecommerce/features/OnBoarding/presentation/views/widgets/on_boarding_skip_button.dart';
import 'package:flutter/material.dart';

class PageViewItemStack extends StatelessWidget {
  const PageViewItemStack({
    super.key,
    required this.bgImage,
    required this.image,
    this.color,
  });

  final String bgImage;
  final String image;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.5,
      child: Stack(
        children: [
          StackBgColor(bgImage: bgImage, color: color),
          StackFruitImage(image: image),
          const OnBoardingScreenSkipButton(),
        ],
      ),
    );
  }
}
