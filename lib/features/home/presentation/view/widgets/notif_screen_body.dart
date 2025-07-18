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
          SliverGap(32),
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
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 56,
                height: 56,
                child: Transform.scale(
                  scale: 1.3,
                  child: Image.asset(
                    Assets.notificationImageSales,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 18),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: RichText(
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
                                text: ' علي اسعار الفواكه بمناسبه العيد',
                                style: AppStyles.styleSemiBold16(context)
                                    .copyWith(color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(
                          '9 صباحا',
                          style: AppStyles.styleRegular13(context).copyWith(
                            color: const Color(0XFF949D9E),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
