import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:advanced_ecommerce/features/OnBoarding/presentation/views/widgets/on_boarding_button_builder.dart';
import 'package:advanced_ecommerce/features/OnBoarding/presentation/view_model/onBoardingCubit/on_boarding_cubit.dart';
import 'package:advanced_ecommerce/features/OnBoarding/presentation/views/widgets/on_boarding_indicator.dart';
import 'package:advanced_ecommerce/features/OnBoarding/presentation/views/widgets/on_boarding_page_view.dart';

class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<OnboardingCubit>();

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: OnBoardingPageView(
              pageController: cubit.pageController,
              onPageChanged: cubit.pageChanged,
            ),
          ),
          const SizedBox(
            height: 38,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              OnboardingIndicator(controller: cubit.pageController),
              const OnBoardingButtonBuilder(),
            ],
          ),
        ],
      ),
    );
  }
}
