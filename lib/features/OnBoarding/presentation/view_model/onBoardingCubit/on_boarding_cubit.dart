import 'package:advanced_ecommerce/features/OnBoarding/presentation/view_model/onBoardingCubit/ob_boarding_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  final PageController pageController = PageController();
  final int lastPageIndex = 1;

  OnboardingCubit() : super(OnboardingState(0));

  bool get isLastPage => state.currentIndex == lastPageIndex;

  void pageChanged(int index) {
    emit(OnboardingState(index));
  }

  void nextPage() {
    if (!isLastPage) {
      final nextIndex = state.currentIndex + 1;
      pageController.animateToPage(
        nextIndex,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
      emit(OnboardingState(nextIndex));
    }
  }

  void skip() {
    pageController.animateToPage(
      lastPageIndex,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
    emit(OnboardingState(lastPageIndex));
  }

  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }
}
