import 'dart:ui';
import 'package:advanced_ecommerce/core/Utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class PurchaseBottomSheet extends StatelessWidget {
  const PurchaseBottomSheet({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          color: const Color(0XFFFFFFFF),
          padding:
              const EdgeInsets.only(left: 16, right: 16, bottom: 32, top: 23),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PurchaseHeader(
                title: title,
              ),
              const PurchaseBody(),
            ],
          ),
        ),
      ),
    );
  }
}

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
        )
      ],
    );
  }
}

class PurchaseBody extends StatelessWidget {
  const PurchaseBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [],
    );
  }
}
