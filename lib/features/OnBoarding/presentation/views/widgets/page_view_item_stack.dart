import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../view_model/onBoardingCubit/on_boarding_cubit.dart';
import '../../view_model/onBoardingCubit/ob_boarding_states.dart';

class PageViewItemStack extends StatelessWidget {
  const PageViewItemStack({
    super.key,
    required this.bgImage,
    required this.image,
    this.color,
  });

  final String bgImage;
  final String image;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.5,
      child: Stack(
        children: [
          SvgPicture.asset(
            bgImage,
            color: color,
            fit: BoxFit.fill,
            width: double.infinity,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SvgPicture.asset(
              image,
              fit: BoxFit.none,
            ),
          ),
          const OnBoardingScreenSkipButton(),
        ],
      ),
    );
  }
}

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
                  child: const Text(
                    'تخط',
                    style: TextStyle(fontSize: 16, color: Colors.black),
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
