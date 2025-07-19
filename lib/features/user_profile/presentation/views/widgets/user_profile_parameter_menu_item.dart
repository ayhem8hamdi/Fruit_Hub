import 'package:advanced_ecommerce/core/Utils/app_assets.dart';
import 'package:advanced_ecommerce/features/user_profile/presentation/views/widgets/custom_menu_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class UserProfileParameterMenuItem extends StatelessWidget {
  const UserProfileParameterMenuItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  Assets.boxIcon,
                ),
                const Gap(7),
                const CustomMenuText(
                  text: 'الملف الشخصي',
                ),
                const Spacer(),
                Image.asset(Assets.leftDirectedBackArrowIcon)
              ],
            ),
            const Gap(5),
            const Divider(
              thickness: 1.4,
              color: Color(0xFFF2F3F3),
            )
          ],
        ),
      ),
    );
  }
}
