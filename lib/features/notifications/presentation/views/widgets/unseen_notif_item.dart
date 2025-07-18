import 'package:advanced_ecommerce/core/Utils/app_colors.dart';
import 'package:advanced_ecommerce/core/Utils/app_styles.dart';
import 'package:advanced_ecommerce/features/notifications/presentation/views/widgets/notification_item.dart';
import 'package:flutter/material.dart';

class NotificationUnseenItemStack extends StatelessWidget {
  const NotificationUnseenItemStack({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          NotificationUnseenItem(image: image),
          Positioned(
            top: 8,
            right: 8,
            child: Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: AppColors.kPrimaryColor,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NotificationUnseenItem extends StatelessWidget {
  const NotificationUnseenItem({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0XFFEBF9F1),
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
                    image,
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
