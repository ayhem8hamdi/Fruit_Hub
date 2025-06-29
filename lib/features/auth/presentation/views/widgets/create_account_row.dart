import 'package:advanced_ecommerce/core/Utils/app_router.dart';
import 'package:advanced_ecommerce/core/Utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateAccountRow extends StatelessWidget {
  const CreateAccountRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'لا تمتلك حساب؟ ',
          style: AppStyles.styleSemiBold16(context)
              .copyWith(color: const Color(0XFF949D9E)),
        ),
        GestureDetector(
          onTap: () => Get.toNamed(AppRouter.signUpScreen),
          child: Text(
            'قم بإنشاء حساب',
            style: AppStyles.styleSemiBold16(context),
          ),
        )
      ],
    );
  }
}
