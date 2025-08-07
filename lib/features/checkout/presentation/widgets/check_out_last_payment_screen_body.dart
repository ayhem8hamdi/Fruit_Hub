import 'package:advanced_ecommerce/features/card_and_products_details/presentation/views/widgets/custom_card_appbar.dart';
import 'package:advanced_ecommerce/features/checkout/presentation/widgets/check_out_step_row.dart';
import 'package:advanced_ecommerce/features/checkout/presentation/widgets/order_resume_item.dart';
import 'package:advanced_ecommerce/features/checkout/presentation/widgets/order_resume_title.dart';
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
        OrderResumeTitle(),
        SliverGap(8),
        OrderResumeItem()
      ],
    );
  }
}
