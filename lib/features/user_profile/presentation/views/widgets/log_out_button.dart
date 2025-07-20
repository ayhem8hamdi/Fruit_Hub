import 'package:advanced_ecommerce/core/Utils/app_assets.dart';
import 'package:advanced_ecommerce/core/Utils/app_colors.dart';
import 'package:advanced_ecommerce/core/Utils/app_styles.dart';
import 'package:flutter/material.dart';

class LogOutButton extends StatelessWidget {
  const LogOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 49, vertical: 15),
        color: const Color(0XFFEBF9F1),
        child: Row(
          children: [
            const Spacer(),
            Text(
              'تسجيل الخروج',
              style: AppStyles.styleSemiBold13(context)
                  .copyWith(color: AppColors.kPrimaryColor),
            ),
            const Spacer(),
            Image.asset(Assets.logOutIcon)
          ],
        ),
      ),
    );
  }
}
