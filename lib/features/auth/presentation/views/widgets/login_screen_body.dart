import 'package:advanced_ecommerce/core/Utils/app_router.dart';
import 'package:advanced_ecommerce/features/auth/presentation/views/widgets/connect_option.dart';
import 'package:advanced_ecommerce/features/auth/presentation/views/widgets/create_account_row.dart';
import 'package:advanced_ecommerce/features/auth/presentation/views/widgets/custom_auth_appbar.dart';
import 'package:advanced_ecommerce/features/auth/presentation/views/widgets/login_text_field_form.dart';
import 'package:advanced_ecommerce/features/auth/presentation/views/widgets/or_section.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class LoginScreenBody extends StatelessWidget {
  const LoginScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const CustomAuthAppbar(
                  title: 'تسجيل دخول',
                ),
                const Gap(28),
                const LoginTextFieldsForm(),
                const Gap(33),
                CreateAccountRow(
                  text1: 'لا تمتلك حساب؟ ',
                  text2: 'قم بإنشاء حساب',
                  onTap: () => Get.toNamed(AppRouter.signUpScreen),
                ),
                const Gap(36),
                const OrSection(),
                const Gap(22),
                const ConnectLoginOptions(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
