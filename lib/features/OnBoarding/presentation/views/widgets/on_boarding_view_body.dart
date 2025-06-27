import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:advanced_ecommerce/features/OnBoarding/presentation/view_model/onBoardingCubit/on_boarding_cubit.dart';
import 'package:advanced_ecommerce/features/OnBoarding/presentation/view_model/onBoardingCubit/ob_boarding_states.dart';
import 'package:advanced_ecommerce/features/OnBoarding/presentation/views/widgets/on_boarding_indicator.dart';
import 'package:advanced_ecommerce/features/OnBoarding/presentation/views/widgets/on_boarding_page_view.dart';

class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<OnboardingCubit>();

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: OnBoardingPageView(
              pageController: cubit.pageController,
              onPageChanged: cubit.pageChanged,
              isLastPage: cubit.isLastPage,
            ),
          ),
          OnboardingIndicator(controller: cubit.pageController),
          BlocBuilder<OnboardingCubit, OnboardingState>(
            builder: (context, state) {
              return Visibility(
                visible: cubit.isLastPage,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: ElevatedButton(
                    onPressed: () {
                      //create routing to home
                    },
                    child: const Text('Get Started'),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
