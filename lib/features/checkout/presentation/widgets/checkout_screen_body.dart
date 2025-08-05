import 'package:advanced_ecommerce/features/card_and_products_details/presentation/views/widgets/custom_card_appbar.dart';
import 'package:advanced_ecommerce/features/checkout/presentation/widgets/check_out_step_row.dart';
import 'package:advanced_ecommerce/features/checkout/presentation/widgets/checkout_screen_custom_button.dart';
import 'package:advanced_ecommerce/features/checkout/presentation/widgets/payment_method_selector.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CheckoutScreenBody extends StatelessWidget {
  const CheckoutScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        CustomCardAppBar(
          title: 'الشحن',
        ),
        SliverGap(16),
        CheckoutStepsRow(
          stepNumber: 0,
        ),
        SliverGap(32),
        PaymentMethodSelector(),
        SliverGap(100),
        CheckoutScreenCustomButton()
      ],
    );
  }
}
