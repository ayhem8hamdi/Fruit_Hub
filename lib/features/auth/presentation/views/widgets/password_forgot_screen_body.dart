import 'package:advanced_ecommerce/core/Utils/app_styles.dart';
import 'package:advanced_ecommerce/features/auth/presentation/views/widgets/custom_auth_appbar.dart';
import 'package:advanced_ecommerce/features/auth/presentation/views/widgets/password_forgot_form.dart';
import 'package:flutter/material.dart';

import 'package:gap/gap.dart';

class PasswordForgotScreenBody extends StatelessWidget {
  const PasswordForgotScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomAuthAppbar(
              title: 'نسيان كلمة المرور',
            ),
            Gap(28),
            ForgotPasswordText(),
            Gap(31),
            ForgotPasswordForm()
          ],
        ),
      ),
    );
  }
}

class ForgotPasswordText extends StatelessWidget {
  const ForgotPasswordText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'لا تقلق ، ما عليك سوى كتابة رقم هاتفك وسنرسل رمز التحقق .',
      style: AppStyles.styleSemiBold16(context).copyWith(
          color: const Color(0XFF616A6B).withOpacity(0.9), height: 1.4),
    );
  }
}
