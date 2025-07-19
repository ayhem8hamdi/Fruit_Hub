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
          )
        ],
      ),
    );
  }
}

class UserProfileParameterMenuItem extends StatelessWidget {
  const UserProfileParameterMenuItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Row(
              children: [],
            )
          ],
        ),
      ),
    );
  }
}
