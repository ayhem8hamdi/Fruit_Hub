import 'package:advanced_ecommerce/features/checkout/presentation/widgets/checkout_user_info_screen_body.dart';
import 'package:flutter/material.dart';

class CheckoutUserInfoScreen extends StatelessWidget {
  const CheckoutUserInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: CheckoutUserInfoScreenBody()),
    );
  }
}
