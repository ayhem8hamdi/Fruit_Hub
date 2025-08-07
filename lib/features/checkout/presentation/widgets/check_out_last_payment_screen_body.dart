import 'package:advanced_ecommerce/features/card_and_products_details/presentation/views/widgets/custom_card_appbar.dart';
import 'package:advanced_ecommerce/features/checkout/presentation/widgets/check_out_step_row.dart';
import 'package:advanced_ecommerce/features/checkout/presentation/widgets/checkout_payment_screen_titles.dart';
import 'package:advanced_ecommerce/features/checkout/presentation/widgets/checkout_screen_form.dart';
import 'package:advanced_ecommerce/features/checkout/presentation/widgets/payment_methods_icons_row.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CheckoutLastPaymentScreenBody extends StatelessWidget {
  const CheckoutLastPaymentScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        CustomCardAppBar(
          title: 'الدفع',
        ),
        SliverGap(16),
        CheckoutStepsRow(
          stepNumber: 3,
        ),
        SliverGap(24),
      ],
    );
  }
}
