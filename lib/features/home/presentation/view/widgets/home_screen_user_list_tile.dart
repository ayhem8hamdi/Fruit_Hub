import 'package:advanced_ecommerce/core/Utils/app_assets.dart';
import 'package:advanced_ecommerce/core/Utils/app_router.dart';
import 'package:advanced_ecommerce/core/Utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class HomeScreenUserListTile extends StatelessWidget {
  const HomeScreenUserListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Image.asset(
              Assets.userImage,
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.only(bottom: 2),
            child: Text(
              'صباح الخير !..',
              style: AppStyles.styleRegular16(context),
            ),
          ),
          subtitle: Text(
            'أحمد مصطفي',
            style: AppStyles.styleBold16(context)
                .copyWith(color: const Color(0XFF0C0D0D)),
          ),
          trailing: GestureDetector(
            onTap: () => Get.toNamed(AppRouter.notifScreen),
            child: SvgPicture.asset(
              Assets.notifIcon,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
