import 'package:advanced_ecommerce/features/OnBoarding/presentation/views/widgets/on_boarding_button.dart';
import 'package:advanced_ecommerce/features/auth/presentation/views/widgets/create_account_row.dart';
import 'package:advanced_ecommerce/features/auth/presentation/views/widgets/custom_auth_appbar.dart';
import 'package:advanced_ecommerce/features/auth/presentation/views/widgets/custom_password_field.dart';
import 'package:advanced_ecommerce/features/auth/presentation/views/widgets/custom_text_field.dart';
import 'package:advanced_ecommerce/features/auth/presentation/views/widgets/password_forgot_link.dart';
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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomAuthAppbar(),
              Gap(28),
              CustomBorderTextField(hintText: 'البريد الإلكتروني'),
              Gap(16),
              CustomPasswordTextField(
                hintText: 'كلمة المرور',
              ),
              Gap(20),
              PasswordForgotNavLink(),
              Gap(37),
              OnBoardingButton(isActive: true, text: 'تسجيل دخول'),
              Gap(33),
              CreateAccountRow()
            ],
          ),
        ),
      ),
    );
  }
}
