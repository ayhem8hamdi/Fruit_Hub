import 'package:advanced_ecommerce/features/user_profile/presentation/views/widgets/pop_up_logout_button.dart';
import 'package:flutter/material.dart';

class CheckoutScreenCustomButton extends StatelessWidget {
  const CheckoutScreenCustomButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: PopUpLogoutButton(
        text: "التالي",
      ),
    ));
  }
}
