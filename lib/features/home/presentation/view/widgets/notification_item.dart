import 'package:advanced_ecommerce/core/Utils/app_assets.dart';
import 'package:advanced_ecommerce/core/Utils/app_styles.dart';
import 'package:flutter/material.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 7),
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
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Expanded(
                    child: NotifListTileTextContent(),
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
            ),
          ],
        ),
      ),
    );
  }
}

class NotifListTileTextContent extends StatelessWidget {
  const NotifListTileTextContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
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
    );
  }
}
