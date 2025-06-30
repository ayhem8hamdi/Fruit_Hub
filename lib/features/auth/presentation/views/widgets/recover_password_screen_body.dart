import 'package:advanced_ecommerce/core/Utils/app_styles.dart';
import 'package:advanced_ecommerce/features/auth/presentation/views/widgets/code_field_form.dart';
import 'package:advanced_ecommerce/features/auth/presentation/views/widgets/custom_auth_appbar.dart';
import 'package:advanced_ecommerce/features/auth/presentation/views/widgets/password_forgot_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class RecoverPasswordScreenBody extends StatelessWidget {
  const RecoverPasswordScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomAuthAppbar(title: 'التحقق من الرمز'),
            Gap(28),
            ForgotPasswordText(
              text:
                  'أدخل الرمز الذي أرسلناه إلى عنوان بريد التالي Max***@gmail.com',
            ),
            Gap(30),
            CodeFieldsForm(),
            Gap(24),
            ResendCodeWidget()
          ],
        ),
      ),
    );
  }
}

class ResendCodeWidget extends StatelessWidget {
  const ResendCodeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'إعادة إرسال الرمز',
      textAlign: TextAlign.center,
      style: AppStyles.styleSemiBold16(context)
          .copyWith(color: const Color(0XFF2D9F5D)),
    );
  }
}
