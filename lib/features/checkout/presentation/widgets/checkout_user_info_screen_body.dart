import 'package:advanced_ecommerce/features/card_and_products_details/presentation/views/widgets/custom_card_appbar.dart';
import 'package:advanced_ecommerce/features/checkout/presentation/widgets/check_out_step_row.dart';
import 'package:advanced_ecommerce/features/checkout/presentation/widgets/checkout_screen_body_form.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CheckoutUserInfoScreenBody extends StatelessWidget {
  const CheckoutUserInfoScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        CustomCardAppBar(
          title: 'العنوان',
        ),
        SliverGap(16),
        CheckoutStepsRow(
          stepNumber: 1,
        ),
        SliverGap(24),
        CheckoutScreenBodyForm()
      ],
    );
  }
}
