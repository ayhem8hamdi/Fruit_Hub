import 'package:advanced_ecommerce/features/auth/presentation/views/widgets/create_account_row.dart';
import 'package:advanced_ecommerce/features/auth/presentation/views/widgets/custom_auth_appbar.dart';
import 'package:advanced_ecommerce/features/auth/presentation/views/widgets/sign_up_form_text_fields.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class SignUpScreenBody extends StatelessWidget {
  const SignUpScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const CustomAuthAppbar(
                title: 'حساب جديد',
              ),
              const Gap(28),
              const SignUpTextFieldsForm(),
              const Gap(27),
              CreateAccountRow(
                text1: ' تمتلك حساب  بالفعل؟ ',
                text2: 'تسجيل دخول',
                onTap: () => Get.back(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
