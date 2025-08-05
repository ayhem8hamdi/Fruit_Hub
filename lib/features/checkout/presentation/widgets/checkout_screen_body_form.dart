import 'package:advanced_ecommerce/core/Utils/app_styles.dart';
import 'package:advanced_ecommerce/features/auth/presentation/views/widgets/custom_text_field.dart';
import 'package:advanced_ecommerce/features/checkout/presentation/widgets/checkout_screen_custom_button.dart';
import 'package:advanced_ecommerce/features/user_profile/presentation/views/widgets/switch_toggle_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CheckoutScreenBodyForm extends StatelessWidget {
  const CheckoutScreenBodyForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomBorderTextField(
              hintText: 'الاسم كامل',
            ),
            Gap(10),
            CustomBorderTextField(hintText: 'البريد الإلكتروني'),
            Gap(10),
            CustomBorderTextField(hintText: 'العنوان'),
            Gap(10),
            CustomBorderTextField(hintText: 'المدينه'),
            Gap(10),
            CustomBorderTextField(hintText: 'رقم الطابق , رقم الشقه ..'),
            Gap(18),
            Padding(
              padding: EdgeInsets.only(right: 4),
              child: SaveAdressToggleButtonRow(),
            ),
            Gap(64),
            CheckoutScreenCustomButton()
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
