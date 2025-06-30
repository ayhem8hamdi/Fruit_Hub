import 'package:advanced_ecommerce/features/auth/presentation/views/widgets/create_new_password_screen_body.dart';
import 'package:flutter/material.dart';

class CreateNewPasswordScreen extends StatelessWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: CreateNewPasswordScreenBody()),
    );
  }
}
