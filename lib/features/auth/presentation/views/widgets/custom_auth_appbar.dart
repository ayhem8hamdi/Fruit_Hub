import 'package:advanced_ecommerce/core/Utils/app_styles.dart';
import 'package:advanced_ecommerce/features/auth/presentation/views/widgets/custom_arrow_back.dart';
import 'package:flutter/material.dart';

class CustomAuthAppbar extends StatelessWidget {
  const CustomAuthAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              'تسجيل دخول',
              style: AppStyles.styleBold19(context),
            ),
          ),
          const Align(
            alignment: Alignment.centerRight,
            child: AuthAppBarCustomIcon(),
          ),
        ],
      ),
    );
  }
}
