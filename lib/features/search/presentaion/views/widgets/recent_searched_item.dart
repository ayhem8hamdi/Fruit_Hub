import 'package:advanced_ecommerce/core/Utils/app_assets.dart';
import 'package:advanced_ecommerce/core/Utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class RecentSearchedItem extends StatelessWidget {
  const RecentSearchedItem({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        children: [
          SvgPicture.asset(Assets.clockTimeIcon),
          const Gap(16),
          Text(
            name,
            style:
                AppStyles.styleRegular16(context).copyWith(color: Colors.black),
          ),
          const Spacer(),
          SvgPicture.asset(Assets.closeIcon)
        ],
      ),
    );
  }
}
