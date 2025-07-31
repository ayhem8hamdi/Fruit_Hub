import 'package:advanced_ecommerce/features/OnBoarding/presentation/views/widgets/on_boarding_button.dart';
import 'package:flutter/material.dart';

class PaymentMethodsButton extends StatelessWidget {
  const PaymentMethodsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverFillRemaining(
      hasScrollBody: false,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(child: SizedBox()),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: OnBoardingButton(text: ' +  أضف وسيلة دفع جديده'),
          ),
          Flexible(
              child: SizedBox(
            height: 80,
          ))
        ],
      ),
    );
  }
}
