import 'package:advanced_ecommerce/features/auth/presentation/views/widgets/create_new_password_form.dart';
import 'package:advanced_ecommerce/features/auth/presentation/views/widgets/custom_auth_appbar.dart';
import 'package:advanced_ecommerce/features/auth/presentation/views/widgets/password_forgot_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CreateNewPasswordScreenBody extends StatelessWidget {
  const CreateNewPasswordScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomAuthAppbar(title: 'كلمة مرور جديدة'),
            Gap(28),
            ForgotPasswordText(
                isCreateNewPasswordScreen: 'yes',
                text: 'قم بإنشاء كلمة مرور جديدة لتسجيل الدخول'),
            Gap(36),
            CreateNewPasswordForm()
          ],
        ),
      ),
    );
  }
}
