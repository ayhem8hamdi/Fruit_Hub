import 'package:advanced_ecommerce/features/auth/presentation/views/widgets/recover_password_screen_body.dart';
import 'package:flutter/material.dart';

class RecoverPasswordScreen extends StatelessWidget {
  const RecoverPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: RecoverPasswordScreenBody()));
  }
}
