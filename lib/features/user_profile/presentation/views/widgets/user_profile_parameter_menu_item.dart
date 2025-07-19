import 'package:advanced_ecommerce/core/Utils/app_assets.dart';
import 'package:advanced_ecommerce/features/user_profile/data/models/user_profile_parameter_menu.dart';
import 'package:advanced_ecommerce/features/user_profile/presentation/views/widgets/custom_menu_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MenuItem extends StatelessWidget {
  const MenuItem({
    super.key,
    required this.item,
  });

  final UserProfileParameterMenu item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: item.onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(item.image),
                const Gap(7),
                CustomMenuText(text: item.title),
                const Spacer(),
                Image.asset(Assets.leftDirectedBackArrowIcon, width: 14),
              ],
            ),
            const Gap(5),
            const Divider(
              thickness: 1.4,
              color: Color(0xFFF2F3F3),
            ),
            const Gap(4)
          ],
        ),
      ),
    );
  }
}
