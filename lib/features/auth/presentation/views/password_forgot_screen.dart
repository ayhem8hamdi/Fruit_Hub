import 'package:advanced_ecommerce/features/auth/presentation/views/widgets/password_forgot_screen_body.dart';
import 'package:flutter/material.dart';

class PasswordForgotScreen extends StatelessWidget {
  const PasswordForgotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: PasswordForgotScreenBody()),
    );
  }
}
