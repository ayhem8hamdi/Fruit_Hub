import 'package:advanced_ecommerce/core/Utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PaymentTypeContainer extends StatelessWidget {
  const PaymentTypeContainer(
      {super.key, required this.text, required this.icon});
  final String text;
  final String icon;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: const Color(0XFFF9FAFA),
            border: Border.all(color: const Color(0XFFE6E9EA))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              text,
              style: AppStyles.styleBold16(context)
                  .copyWith(color: const Color(0XFF949D9E)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: SvgPicture.asset(icon),
            ),
          ],
        ),
      ),
    );
  }
}
