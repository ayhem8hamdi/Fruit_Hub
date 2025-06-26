import 'package:advanced_ecommerce/features/OnBoarding/presentation/views/widgets/page_view_item_stack.dart';
import 'package:advanced_ecommerce/features/OnBoarding/presentation/views/widgets/page_view_subtitle.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem(
      {super.key,
      required this.image,
      required this.bgImage,
      required this.subtitle,
      required this.title,
      this.color});
  final String image, bgImage;
  final String subtitle;
  final Widget title;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        PageViewItemStack(
          bgImage: bgImage,
          image: image,
          color: color,
        ),
        const Flexible(child: Gap(64)),
        title,
        const Gap(24),
        PageViewItemSubtitle(subtitle: subtitle),
      ],
    );
  }
}
