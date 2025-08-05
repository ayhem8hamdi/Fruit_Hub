import 'package:advanced_ecommerce/features/checkout/presentation/widgets/checkout_pay_screen_body.dart';
import 'package:flutter/material.dart';

class CheckoutPayScreen extends StatelessWidget {
  const CheckoutPayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: CheckoutPayScreenBody()),
    );
  }
}
