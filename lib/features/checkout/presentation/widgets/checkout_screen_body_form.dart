import 'package:advanced_ecommerce/core/Utils/Router/app_router.dart';
import 'package:advanced_ecommerce/core/Utils/app_styles.dart';
import 'package:advanced_ecommerce/features/auth/presentation/views/widgets/custom_text_field.dart';
import 'package:advanced_ecommerce/features/checkout/presentation/widgets/checkout_screen_custom_button.dart';
import 'package:advanced_ecommerce/features/user_profile/presentation/views/widgets/switch_toggle_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class CheckoutScreenBodyForm extends StatelessWidget {
  const CheckoutScreenBodyForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomBorderTextField(
              hintText: 'الاسم كامل',
            ),
            const Gap(10),
            const CustomBorderTextField(hintText: 'البريد الإلكتروني'),
            const Gap(10),
            const CustomBorderTextField(hintText: 'العنوان'),
            const Gap(10),
            const CustomBorderTextField(hintText: 'المدينه'),
            const Gap(10),
            const CustomBorderTextField(hintText: 'رقم الطابق , رقم الشقه ..'),
            const Gap(18),
            const Padding(
              padding: EdgeInsets.only(right: 4),
              child: SaveAdressToggleButtonRow(),
            ),
            const Gap(64),
            CheckoutScreenCustomButton(
              onTap: () => Get.toNamed(AppRouter.checkoutPayScreen),
            )
          ],
        ),
      ),
    );
  }
}

class SaveAdressToggleButtonRow extends StatelessWidget {
  const SaveAdressToggleButtonRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const ToggleButton(),
        const Gap(8),
        Text(
          'حفظ العنوان',
          style: AppStyles.styleSemiBold13(context)
              .copyWith(color: const Color(0XFF949D9E)),
        )
      ],
    );
  }
}
