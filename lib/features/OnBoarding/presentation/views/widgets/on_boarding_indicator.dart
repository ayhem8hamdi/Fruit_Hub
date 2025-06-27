import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingIndicator extends StatelessWidget {
  final PageController controller;

  const OnboardingIndicator({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: controller,
      count: 3,
      effect: WormEffect(
        dotHeight: 10,
        dotWidth: 10,
        spacing: 16,
        activeDotColor: Colors.green,
        dotColor: Colors.grey.shade300,
      ),
    );
  }
}
