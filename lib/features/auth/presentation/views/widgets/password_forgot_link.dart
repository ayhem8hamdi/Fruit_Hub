import 'package:advanced_ecommerce/core/Utils/app_styles.dart';
import 'package:flutter/material.dart';

class PasswordForgotNavLink extends StatelessWidget {
  const PasswordForgotNavLink({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: null,
      child: Padding(
        padding: const EdgeInsets.only(left: 5),
        child: Text(
          'نسيت كلمة المرور ؟',
          textAlign: TextAlign.left,
          style: AppStyles.styleSemiBold13(context)
              .copyWith(color: const Color(0XFF2D9F5D)),
        ),
      ),
    );
  }
}
