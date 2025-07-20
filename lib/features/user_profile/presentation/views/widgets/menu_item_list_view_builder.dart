import 'package:advanced_ecommerce/core/Utils/app_assets.dart';
import 'package:advanced_ecommerce/features/user_profile/data/models/user_profile_parameter_menu.dart';
import 'package:advanced_ecommerce/features/user_profile/presentation/views/widgets/menu_item_widget.dart';
import 'package:flutter/material.dart';

class MenuItemListViewBuilder extends StatelessWidget {
  const MenuItemListViewBuilder({super.key});

  static List<UserProfileParameterMenu> items = [
    UserProfileParameterMenu(
      image: Assets.menuUser,
      title: 'الملف الشخصي',
      onTap: () {
        debugPrint('Navigate to profile');
      },
    ),
    UserProfileParameterMenu(
      image: Assets.boxIcon,
      title: 'طلباتي',
      onTap: () {
        debugPrint('Navigate to orders');
      },
    ),
    UserProfileParameterMenu(
      image: Assets.waletIcon,
      title: 'المدفوعات',
      onTap: () {
        debugPrint('Navigate to favorites');
      },
    ),
    UserProfileParameterMenu(
      image: Assets.favouritesIcon,
      title: 'المفضلة',
      onTap: () {
        debugPrint('Navigate to favorites');
      },
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: items.length,
        (context, index) {
          final item = items[index];
          return MenuItem(item: item);
        },
      ),
    );
  }
}
