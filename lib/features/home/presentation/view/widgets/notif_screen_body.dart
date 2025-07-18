import 'package:advanced_ecommerce/core/Utils/app_assets.dart';
import 'package:advanced_ecommerce/core/Utils/app_styles.dart';
import 'package:advanced_ecommerce/features/home/presentation/view/widgets/custom_most_popular_product_appbar.dart';
import 'package:advanced_ecommerce/features/home/presentation/view/widgets/notif_screen_text_titles_row.dart';
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
          NotifScreenTitlesTextRow(),
          SliverGap(16),
          NotificationItem()
        ],
      ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  const NotificationItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(Assets.notificationImageSales),
      title: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'خصم ',
              style: AppStyles.styleSemiBold16(context)
                  .copyWith(color: Colors.black),
            ),
            TextSpan(
              text: '50%',
              style: AppStyles.styleSemiBold16(context)
                  .copyWith(color: const Color(0XFFEB5757)),
            ),
            TextSpan(
              text: 'علي اسعار الفواكه بمناسبه العيد',
              style: AppStyles.styleSemiBold16(context)
                  .copyWith(color: Colors.black),
            ),
          ],
        ),
      ),
      trailing: Text(
        '9 صباحا',
        style: AppStyles.styleRegular13(context).copyWith(
          color: const Color(0XFF949D9E),
        ),
      ),
    );
  }
}
