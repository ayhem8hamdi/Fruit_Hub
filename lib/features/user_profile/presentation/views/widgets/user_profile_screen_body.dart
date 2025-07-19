import 'package:advanced_ecommerce/core/Utils/app_assets.dart';
import 'package:advanced_ecommerce/core/Utils/app_styles.dart';
import 'package:advanced_ecommerce/features/user_profile/presentation/views/widgets/custom_user_appbar.dart';
import 'package:advanced_ecommerce/features/user_profile/presentation/views/widgets/user_profile_account_info_row.dart';
import 'package:advanced_ecommerce/features/user_profile/presentation/views/widgets/user_profile_screen_custom_title.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class UserProfileScreenBody extends StatelessWidget {
  const UserProfileScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: CustomScrollView(
        slivers: [
          CustomUserAppBar(),
          SliverGap(16),
          UserProfileAccountInfoRow(),
          SliverGap(16),
          UserProfileScreenCustomTitle(
            title: 'عام',
          ),
          SliverGap(18),
          UserProfileParameterMenuItem()
        ],
      ),
    );
  }
}

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

class CustomMenuText extends StatelessWidget {
  const CustomMenuText({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppStyles.styleSemiBold11(context).copyWith(
        color: const Color(0XFF949D9E),
      ),
    );
  }
}
