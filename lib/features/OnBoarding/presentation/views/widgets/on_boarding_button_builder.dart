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

    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 43, top: 29),
      child: OnBoardingButton(
        text: 'ابدأ الآن',
        isActive: isLastPage,
        onTap: isLastPage
            ? () {
                cubit.navigate();
              }
            : null,
      ),
    );
  }
}
