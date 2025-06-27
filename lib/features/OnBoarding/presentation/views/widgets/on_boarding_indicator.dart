import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingIndicator extends StatelessWidget {
  final PageController controller;

  const OnboardingIndicator({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: SmoothPageIndicator(
          controller: controller,
          count: 2,
          effect: WormEffect(
            dotHeight: 10,
            dotWidth: 10,
            spacing: 12,
            activeDotColor: Colors.green,
            dotColor: Colors.grey.shade300,
          ),
        ),
      ),
    );
  }
}
