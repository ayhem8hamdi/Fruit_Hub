import 'package:advanced_ecommerce/core/Utils/app_assets.dart';
import 'package:advanced_ecommerce/features/home/presentation/view/widgets/custom_most_popular_product_appbar.dart';
import 'package:advanced_ecommerce/features/home/presentation/view/widgets/notif_screen_text_titles_row.dart';
import 'package:advanced_ecommerce/features/home/presentation/view/widgets/notification_item.dart';
import 'package:advanced_ecommerce/features/home/presentation/view/widgets/unseen_notif_item.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class NotifScreenBody extends StatelessWidget {
  const NotifScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: CustomScrollView(
        slivers: [
          CustomMostPopularProductAppbar(title: 'الاشعارات'),
          SliverGap(16),
          NotifScreenTitlesTextRow(
            notifTimeTitles: 'جديد  ',
          ),
          SliverGap(16),
          NotificationItem(),
          //we gonna change this with list builder :
          SliverGap(8),
          NotificationUnseenItemStack(
            image: Assets.notificationImagePourcentage,
          ),
          SliverGap(8),
          NotificationUnseenItemStack(
            image: Assets.notificationImageSales,
          ),
          SliverGap(11),
          NotifScreenTitlesTextRow(
            notifTimeTitles: 'في وقت سابق  ',
          ),

          SliverGap(16),
          NotificationItem(),
          //we gonna change this with list builder :
          SliverGap(8),
          NotificationUnseenItemStack(
            image: Assets.notificationImagePourcentage,
          ),
          SliverGap(8),
          NotificationUnseenItemStack(
            image: Assets.notificationImageSales,
          ),
          SliverGap(8),
        ],
      ),
    );
  }
}
