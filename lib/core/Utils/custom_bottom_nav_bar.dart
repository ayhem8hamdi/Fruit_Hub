// custom_bottom_nav_bar.dart

import 'package:advanced_ecommerce/core/Utils/app_assets.dart';
import 'package:advanced_ecommerce/core/Utils/app_colors.dart';
import 'package:advanced_ecommerce/core/Utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class CustomBottomNavBar extends StatefulWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  late final Map<String, Image> _icons;

  @override
  void initState() {
    super.initState();
    _icons = {
      'home': Image.asset(Assets.homeIcon),
      'homeActive': Image.asset(Assets.homeActiveIcon),
      'products': Image.asset(Assets.productsIcon),
      'productsActive': Image.asset(Assets.productsActiveIcon),
      'cart': Image.asset(Assets.shoppingCardIcon),
      'cartActive': Image.asset(Assets.shoppingCardActiveIcon),
      'profile': Image.asset(Assets.profileIcon),
      'profileActive': Image.asset(Assets.activeProfileIcon),
    };
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Precache all icons once per screen context
    for (final icon in _icons.values) {
      precacheImage(icon.image, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 3,
          )
        ],
      ),
      child: SalomonBottomBar(
        itemPadding: const EdgeInsets.symmetric(vertical: 13, horizontal: 20),
        currentIndex: widget.currentIndex,
        onTap: widget.onTap,
        items: [
          SalomonBottomBarItem(
            icon: _icons['home']!,
            activeIcon: _icons['homeActive']!,
            title: Text("الرئيسية", style: AppStyles.styleSemiBold11(context)),
            selectedColor: AppColors.kPrimaryColor,
          ),
          SalomonBottomBarItem(
            icon: _icons['products']!,
            activeIcon: _icons['productsActive']!,
            title: Text("المنتجات", style: AppStyles.styleSemiBold11(context)),
            selectedColor: AppColors.kPrimaryColor,
          ),
          SalomonBottomBarItem(
            icon: _icons['cart']!,
            activeIcon: _icons['cartActive']!,
            title:
                Text("سلة التسوق", style: AppStyles.styleSemiBold11(context)),
            selectedColor: AppColors.kPrimaryColor,
          ),
          SalomonBottomBarItem(
            icon: _icons['profile']!,
            activeIcon: _icons['profileActive']!,
            title: Text("حسابي", style: AppStyles.styleSemiBold11(context)),
            selectedColor: AppColors.kPrimaryColor,
          ),
        ],
      ),
    );
  }
}
