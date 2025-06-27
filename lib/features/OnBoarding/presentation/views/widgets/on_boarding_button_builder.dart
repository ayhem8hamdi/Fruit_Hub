import 'package:advanced_ecommerce/features/OnBoarding/presentation/view_model/onBoardingCubit/ob_boarding_states.dart';
import 'package:advanced_ecommerce/features/OnBoarding/presentation/view_model/onBoardingCubit/on_boarding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardingButtonBuilder extends StatelessWidget {
  const OnBoardingButtonBuilder({
    super.key,
    required this.cubit,
  });

  final OnboardingCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingCubit, OnboardingState>(
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
    );
  }
}
