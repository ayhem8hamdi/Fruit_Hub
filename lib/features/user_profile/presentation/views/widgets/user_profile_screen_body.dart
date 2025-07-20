import 'package:advanced_ecommerce/features/user_profile/presentation/views/widgets/custom_user_appbar.dart';
import 'package:advanced_ecommerce/features/user_profile/presentation/views/widgets/menu_item_bottom_section.dart';
import 'package:advanced_ecommerce/features/user_profile/presentation/views/widgets/menu_item_list_view_builder.dart';
import 'package:advanced_ecommerce/features/user_profile/presentation/views/widgets/user_profile_account_info_row.dart';
import 'package:advanced_ecommerce/features/user_profile/presentation/views/widgets/user_profile_screen_custom_title.dart';
import 'package:advanced_ecommerce/features/user_profile/presentation/views/widgets/who_are_we_section.dart';
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
          MenuItemListViewBuilder(),
          MenuItemsBottomSection(),
          SliverGap(18),
          UserProfileScreenCustomTitle(
            title: 'المساعده',
          ),
          SliverGap(14),
          WhoAreWeSection(),
          SliverGap(57),
        ],
      ),
    );
  }
}
