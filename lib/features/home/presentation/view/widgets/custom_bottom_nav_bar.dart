import 'package:advanced_ecommerce/core/Utils/app_assets.dart';
import 'package:advanced_ecommerce/core/Utils/app_colors.dart';
import 'package:advanced_ecommerce/core/Utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

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
            color: Colors.black.withOpacity(0.106),
            spreadRadius: 2.6,
            blurRadius: 2.3,
          )
        ],
      ),
      child: SalomonBottomBar(
        itemPadding: const EdgeInsets.symmetric(vertical: 13, horizontal: 20),
        currentIndex: currentIndex,
        onTap: onTap,
        items: [
          SalomonBottomBarItem(
            icon: Image.asset(Assets.homeIcon),
            activeIcon: Image.asset(Assets.homeActiveIcon),
            title: Text("الرئيسية", style: AppStyles.styleSemiBold11(context)),
            selectedColor: AppColors.kPrimaryColor,
          ),
          SalomonBottomBarItem(
            icon: Image.asset(Assets.productsIcon),
            activeIcon: Image.asset(Assets.productsActiveIcon),
            title: Text("المنتجات", style: AppStyles.styleSemiBold11(context)),
            selectedColor: AppColors.kPrimaryColor,
          ),
          SalomonBottomBarItem(
            icon: Image.asset(Assets.shoppingCardIcon),
            activeIcon: Image.asset(Assets.shoppingCardActiveIcon),
            title:
                Text("سلة التسوق", style: AppStyles.styleSemiBold11(context)),
            selectedColor: AppColors.kPrimaryColor,
          ),
          SalomonBottomBarItem(
            icon: Image.asset(Assets.profileIcon),
            activeIcon: Image.asset(Assets.activeProfileIcon),
            title: Text("حسابي", style: AppStyles.styleSemiBold11(context)),
            selectedColor: AppColors.kPrimaryColor,
          ),
        ],
      ),
    );
  }
}
