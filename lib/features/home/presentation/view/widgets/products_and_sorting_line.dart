import 'package:advanced_ecommerce/core/Utils/app_styles.dart';
import 'package:advanced_ecommerce/features/home/presentation/view/widgets/custom_reusable_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:flutter_svg/svg.dart';

class OurProductsTitleAndSortingIconLine extends StatelessWidget {
  const OurProductsTitleAndSortingIconLine(
      {super.key, required this.text, required this.image});
  final String text;
  final String image;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style:
                  AppStyles.styleBold16(context).copyWith(color: Colors.black),
            ),
            GestureDetector(
                child: SvgPicture.asset(image),
                onTap: () {
                  showCupertinoModalBottomSheet(
                    context: context,
                    useRootNavigator: true,
                    expand: false,
                    barrierColor: Colors.black.withOpacity(0.3),
                    backgroundColor: Colors.transparent,
                    builder: (context) => const PurchaseBottomSheet(
                      title: "ترتيب حسب :",
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
