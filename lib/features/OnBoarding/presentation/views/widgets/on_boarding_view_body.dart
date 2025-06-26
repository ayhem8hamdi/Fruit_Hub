import 'package:advanced_ecommerce/features/OnBoarding/presentation/views/widgets/on_boarding_page_view.dart';
import 'package:flutter/material.dart';

class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [Expanded(child: OnBoardingPageView())],
        ),
      ),
    );
  }
}
