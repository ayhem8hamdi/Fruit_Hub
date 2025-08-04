import 'package:advanced_ecommerce/core/Utils/Router/nested_routing.dart';
import 'package:advanced_ecommerce/core/Utils/app_assets.dart';
import 'package:advanced_ecommerce/features/user_profile/data/models/user_profile_parameter_menu.dart';
import 'package:advanced_ecommerce/features/user_profile/presentation/views/widgets/menu_item_widget.dart';
import 'package:flutter/material.dart';

class WhoAreWeSection extends StatelessWidget {
  const WhoAreWeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: MenuItem(
          item: UserProfileParameterMenu(
              title: 'من نحن',
              image: Assets.infoCircleIcon,
              onTap: () {
                Navigator.of(context).pushNamed(
                  BaseTabRoutes.whoAreWeScreen,
                );
              })),
    );
  }
}
