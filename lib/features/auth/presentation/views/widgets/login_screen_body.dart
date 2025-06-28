import 'package:advanced_ecommerce/features/auth/presentation/views/widgets/custom_auth_appbar.dart';
import 'package:advanced_ecommerce/features/auth/presentation/views/widgets/custom_password_field.dart';
import 'package:advanced_ecommerce/features/auth/presentation/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class LoginScreenBody extends StatelessWidget {
  const LoginScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              CustomAuthAppbar(),
              Gap(28),
              CustomBorderTextField(hintText: 'البريد الإلكتروني'),
              Gap(16),
              CustomPasswordTextField(
                hintText: 'كلمة المرور',
              )
            ],
          ),
        ),
      ),
    );
  }
}
