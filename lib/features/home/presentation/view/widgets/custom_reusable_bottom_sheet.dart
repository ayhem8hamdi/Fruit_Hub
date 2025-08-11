import 'dart:ui';
import 'package:advanced_ecommerce/features/home/presentation/view/widgets/bottom_sheet_body.dart';
import 'package:advanced_ecommerce/features/home/presentation/view/widgets/bottom_sheet_header.dart';
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
              Padding(
                padding: const EdgeInsets.only(right: 9),
                child: PurchaseHeader(
                  title: title,
                ),
              ),
              const Gap(11),
              const BottomSheetBody(),
            ],
          ),
        ),
      ),
    );
  }
}
