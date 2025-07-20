import 'package:advanced_ecommerce/core/Utils/app_assets.dart';
import 'package:advanced_ecommerce/features/user_profile/data/models/user_profile_parameter_menu.dart';
import 'package:advanced_ecommerce/features/user_profile/presentation/views/widgets/custom_user_appbar.dart';
import 'package:advanced_ecommerce/features/user_profile/presentation/views/widgets/menu_item_list_view_builder.dart';
import 'package:advanced_ecommerce/features/user_profile/presentation/views/widgets/menu_item_widget.dart';
import 'package:advanced_ecommerce/features/user_profile/presentation/views/widgets/user_profile_account_info_row.dart';
import 'package:advanced_ecommerce/features/user_profile/presentation/views/widgets/user_profile_screen_custom_title.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class UserProfileScreenBody extends StatelessWidget {
  const UserProfileScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
          MenuItemWithToggleButton(
            item: UserProfileParameterMenu(
                title: 'الاشعارات',
                image: Assets.notificationsMenuIcon,
                onTap: () {}),
          )
        ],
      ),
    );
  }
}
