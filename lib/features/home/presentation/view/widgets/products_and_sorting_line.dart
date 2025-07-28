import 'package:advanced_ecommerce/core/Utils/app_styles.dart';
import 'package:flutter/material.dart';
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
            SvgPicture.asset(image)
          ],
        ),
      ),
    );
  }
}
