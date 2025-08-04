import 'package:advanced_ecommerce/features/checkout/presentation/widgets/checkout_screen_body.dart';
import 'package:flutter/material.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: CheckoutScreenBody()),
    );
  }
}
