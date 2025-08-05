import 'package:advanced_ecommerce/core/Utils/Router/app_router.dart';
import 'package:advanced_ecommerce/features/card_and_products_details/presentation/views/widgets/custom_card_appbar.dart';
import 'package:advanced_ecommerce/features/checkout/presentation/widgets/check_out_step_row.dart';
import 'package:advanced_ecommerce/features/checkout/presentation/widgets/checkout_screen_custom_button.dart';
import 'package:advanced_ecommerce/features/checkout/presentation/widgets/payment_method_selector.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class CheckoutScreenBody extends StatelessWidget {
  const CheckoutScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const CustomCardAppBar(
          title: 'الشحن',
        ),
        const SliverGap(16),
        const CheckoutStepsRow(
          stepNumber: 0,
        ),
        const SliverGap(32),
        const PaymentMethodSelector(),
        const SliverGap(100),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CheckoutScreenCustomButton(
              onTap: () => Get.toNamed(AppRouter.checkoutUserInfoScreen),
            ),
          ),
        )
      ],
    );
  }
}
