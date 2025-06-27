import 'package:advanced_ecommerce/core/Utils/app_colors.dart';
import 'package:advanced_ecommerce/features/OnBoarding/presentation/view_model/onBoardingCubit/on_boarding_cubit.dart';
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
      onTap: isLastPage ? () {} : null,
    );
  }
}

class OnBoardingButton extends StatelessWidget {
  final bool isActive;
  final VoidCallback? onTap;

  const OnBoardingButton({
    super.key,
    required this.isActive,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(
          left: 16,
          right: 16,
          bottom: 43,
        ),
        decoration: BoxDecoration(
          color: isActive ? AppColors.kPrimaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
        ),
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 19),
          child: Text('ابدأ الآن',
              style: TextStyle(
                color: isActive ? Colors.white : Colors.transparent,
              )),
        ),
      ),
    );
  }
}
