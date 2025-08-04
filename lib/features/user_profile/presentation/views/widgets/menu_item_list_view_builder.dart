import 'package:advanced_ecommerce/core/Utils/Router/nested_routing.dart';
import 'package:advanced_ecommerce/core/Utils/app_assets.dart';
import 'package:advanced_ecommerce/features/user_profile/data/models/user_profile_parameter_menu.dart';
import 'package:advanced_ecommerce/features/user_profile/presentation/views/widgets/menu_item_widget.dart';
import 'package:flutter/material.dart';

class MenuItemListViewBuilder extends StatelessWidget {
  const MenuItemListViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    List<UserProfileParameterMenu> items = [
      UserProfileParameterMenu(
        image: Assets.menuUser,
        title: 'الملف الشخصي',
        onTap: () {
          Navigator.of(context).pushNamed(BaseTabRoutes.personalData);
        },
      ),
      UserProfileParameterMenu(
        image: Assets.boxIcon,
        title: 'طلباتي',
        onTap: () {
          Navigator.of(context).pushNamed(BaseTabRoutes.onGoingOrders);
        },
      ),
      UserProfileParameterMenu(
        image: Assets.waletIcon,
        title: 'المدفوعات',
        onTap: () {
          Navigator.of(context).pushNamed(BaseTabRoutes.paymentMethods);
        },
      ),
      UserProfileParameterMenu(
        image: Assets.favouritesIcon,
        title: 'المفضلة',
        onTap: () {
          Navigator.of(context).pushNamed(BaseTabRoutes.favouriteItemsScreen);
        },
      ),
    ];
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
