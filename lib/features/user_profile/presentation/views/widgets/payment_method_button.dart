import 'package:advanced_ecommerce/core/Utils/Router/nested_routing.dart';
import 'package:advanced_ecommerce/features/OnBoarding/presentation/views/widgets/on_boarding_button.dart';
import 'package:flutter/material.dart';

class PaymentMethodsButton extends StatelessWidget {
  const PaymentMethodsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Expanded(child: SizedBox()),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: OnBoardingButton(
              text: ' +  أضف وسيلة دفع جديده',
              onTap: () => Navigator.of(context)
                  .pushNamed(BaseTabRoutes.addPaymentMethod),
            ),
          ),
          const Flexible(
              child: SizedBox(
            height: 80,
          ))
        ],
      ),
    );
  }
}
