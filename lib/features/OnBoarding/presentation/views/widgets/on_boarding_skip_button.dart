import 'package:advanced_ecommerce/core/Utils/app_styles.dart';
import 'package:advanced_ecommerce/features/OnBoarding/presentation/view_model/onBoardingCubit/ob_boarding_states.dart';
import 'package:advanced_ecommerce/features/OnBoarding/presentation/view_model/onBoardingCubit/on_boarding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardingScreenSkipButton extends StatelessWidget {
  const OnBoardingScreenSkipButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<OnboardingCubit, OnboardingState>(
        buildWhen: (previous, current) =>
            previous.currentIndex != current.currentIndex,
        builder: (context, state) {
          final isLastPage = context.read<OnboardingCubit>().isLastPage;

          return Visibility(
            visible: !isLastPage,
            child: Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: GestureDetector(
                  onTap: () {
                    context.read<OnboardingCubit>().skip();
                  },
                  child: Text(
                    'تخط',
                    style: AppStyles.styleBold13.copyWith(
                        fontWeight: FontWeight.w400,
                        color: const Color(0XFF949D9E)),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
