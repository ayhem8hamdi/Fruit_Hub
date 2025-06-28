import 'package:advanced_ecommerce/features/OnBoarding/presentation/view_model/onBoardingCubit/on_boarding_cubit.dart';
import 'package:advanced_ecommerce/features/OnBoarding/presentation/views/widgets/on_boarding_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardingButtonBuilder extends StatelessWidget {
  const OnBoardingButtonBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<OnboardingCubit>();
    final isLastPage = cubit.isLastPage;

    return OnBoardingButton(
      isActive: isLastPage,
      onTap: isLastPage
          ? () {
              cubit.navigate();
            }
          : null,
    );
  }
}
