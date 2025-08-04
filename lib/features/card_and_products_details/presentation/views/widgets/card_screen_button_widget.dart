import 'package:advanced_ecommerce/core/Utils/Router/app_router.dart';
import 'package:advanced_ecommerce/features/OnBoarding/presentation/views/widgets/on_boarding_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardScreenButtonWidget extends StatelessWidget {
  const CardScreenButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: OnBoardingButton(
        text: 'الدفع  120جنيه',
        padding: 12,
        onTap: () => Get.toNamed(AppRouter.checkoutScreen),
      ),
    ));
  }
}
