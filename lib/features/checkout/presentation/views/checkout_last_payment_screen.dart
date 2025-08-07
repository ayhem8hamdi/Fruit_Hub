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
