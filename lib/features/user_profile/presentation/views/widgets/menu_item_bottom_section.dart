import 'package:advanced_ecommerce/core/Utils/app_assets.dart';
import 'package:advanced_ecommerce/features/user_profile/data/models/user_profile_parameter_menu.dart';
import 'package:advanced_ecommerce/features/user_profile/presentation/views/widgets/menu_item_widget.dart';
import 'package:flutter/material.dart';

class MenuItemsBottomSection extends StatelessWidget {
  const MenuItemsBottomSection({super.key});

  static List<UserProfileParameterMenu> items = [
    UserProfileParameterMenu(
      image: Assets.notificationsMenuIcon,
      title: 'الاشعارات',
      onTap: () {
        debugPrint('Navigate to profile');
      },
    ),
    UserProfileParameterMenu(
      image: Assets.languageIcon,
      title: 'اللغة',
      onTap: () {
        debugPrint('Navigate to orders');
      },
    ),
    UserProfileParameterMenu(
      image: Assets.magicienPenIcon,
      title: 'الوضع',
      onTap: () {
        debugPrint('Navigate to favorites');
      },
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          MenuItemWithToggleButton(
            item: items[0],
          ),
          MenuItemWithTextWidget(
            item: items[1],
          ),
          MenuItemWithToggleButton(
            item: items[2],
          )
        ],
      ),
    );
  }
}
