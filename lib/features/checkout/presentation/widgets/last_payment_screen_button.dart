import 'package:advanced_ecommerce/core/Utils/Router/app_router.dart';
import 'package:advanced_ecommerce/core/Utils/app_assets.dart';
import 'package:advanced_ecommerce/features/checkout/presentation/widgets/checkout_screen_custom_button.dart';
import 'package:advanced_ecommerce/features/checkout/presentation/widgets/payment_done_pop_up.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LastPaymentScreenButton extends StatelessWidget {
  const LastPaymentScreenButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: CheckoutScreenCustomButton(
          text: 'تأكيد الطلب',
          onTap: () {
            PaymentDonePopUp.showSuccessDialogWithAction(
              context,
              svgAssetPath: Assets.passwordChange,
              buttonLabel: 'الرئيسية',
              onPressed: () {
                Get.toNamed(AppRouter.mainTabs);
              },
            );
          },
        ),
      ),
    );
  }
}
