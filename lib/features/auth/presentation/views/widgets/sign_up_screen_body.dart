import 'package:advanced_ecommerce/features/auth/presentation/views/widgets/custom_auth_appbar.dart';
import 'package:advanced_ecommerce/features/auth/presentation/views/widgets/sign_up_form_text_fields.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SignUpScreenBody extends StatelessWidget {
  const SignUpScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomAuthAppbar(
                title: 'حساب جديد',
              ),
              Gap(28),
              SignUpTextFieldsForm(),
              Gap(33),
            ],
          ),
        ),
      ),
    );
  }
}
