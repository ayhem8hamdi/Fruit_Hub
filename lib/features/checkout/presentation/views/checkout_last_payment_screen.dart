import 'package:advanced_ecommerce/features/checkout/presentation/widgets/check_out_last_payment_screen_body.dart';
import 'package:flutter/material.dart';

class CheckoutLastPaymentScreen extends StatelessWidget {
  const CheckoutLastPaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: CheckoutLastPaymentScreenBody()),
    );
  }
}
