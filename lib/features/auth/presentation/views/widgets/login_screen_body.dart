import 'package:advanced_ecommerce/features/auth/presentation/views/widgets/connect_option.dart';
import 'package:advanced_ecommerce/features/auth/presentation/views/widgets/create_account_row.dart';
import 'package:advanced_ecommerce/features/auth/presentation/views/widgets/custom_auth_appbar.dart';
import 'package:advanced_ecommerce/features/auth/presentation/views/widgets/login_text_field_form.dart';
import 'package:advanced_ecommerce/features/auth/presentation/views/widgets/or_section.dart';
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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomAuthAppbar(
                  title: 'تسجيل دخول',
                ),
                Gap(28),
                LoginTextFieldsForm(),
                Gap(33),
                CreateAccountRow(),
                Gap(36),
                OrSection(),
                Gap(22),
                ConnectLoginOptions(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
