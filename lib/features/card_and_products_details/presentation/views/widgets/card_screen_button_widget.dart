import 'package:advanced_ecommerce/features/OnBoarding/presentation/views/widgets/on_boarding_button.dart';
import 'package:flutter/material.dart';

class CardScreenButtonWidget extends StatelessWidget {
  const CardScreenButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: OnBoardingButton(
        text: 'الدفع  120جنيه',
        padding: 12,
      ),
    ));
  }
}
