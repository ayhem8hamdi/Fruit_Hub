import 'package:advanced_ecommerce/features/user_profile/presentation/views/widgets/pop_up_logout_button.dart';
import 'package:flutter/material.dart';

class CheckoutScreenCustomButton extends StatelessWidget {
  const CheckoutScreenCustomButton({
    super.key,
    this.onTap,
  });
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: PopUpLogoutButton(
        onTap: onTap,
        text: "التالي",
      ),
    ));
  }
}
