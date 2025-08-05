import 'package:advanced_ecommerce/features/user_profile/presentation/views/widgets/pop_up_logout_button.dart';
import 'package:flutter/material.dart';

class CheckoutScreenCustomButton extends StatelessWidget {
  const CheckoutScreenCustomButton({
    super.key,
    this.onTap,
    this.text = "التالي",
  });
  final void Function()? onTap;
  final String text;
  @override
  Widget build(BuildContext context) {
    return PopUpLogoutButton(
      onTap: onTap,
      text: text,
    );
  }
}
