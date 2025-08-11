import 'package:advanced_ecommerce/core/Utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class PurchaseHeader extends StatelessWidget {
  const PurchaseHeader({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Center(
          child: SizedBox(
              width: 60,
              child: Divider(
                thickness: 3,
                color: Color(0XFF131F46),
              )),
        ),
        const Gap(15),
        Text(
          title,
          style: AppStyles.styleBold19(context),
        ),
      ],
    );
  }
}
