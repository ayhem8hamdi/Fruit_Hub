import 'package:advanced_ecommerce/core/Utils/app_router.dart';
import 'package:advanced_ecommerce/core/Utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateAccountRow extends StatelessWidget {
  const CreateAccountRow(
      {super.key, required this.text1, required this.text2, this.onTap});
  final String text1;
  final String text2;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text1,
          style: AppStyles.styleSemiBold16(context)
              .copyWith(color: const Color(0XFF949D9E)),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            text2,
            style: AppStyles.styleSemiBold16(context),
          ),
        )
      ],
    );
  }
}
