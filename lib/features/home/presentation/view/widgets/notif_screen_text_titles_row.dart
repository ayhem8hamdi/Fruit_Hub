import 'package:advanced_ecommerce/core/Utils/app_colors.dart';
import 'package:advanced_ecommerce/core/Utils/app_styles.dart';
import 'package:flutter/material.dart';

class NotifScreenTitlesTextRow extends StatelessWidget {
  const NotifScreenTitlesTextRow({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 19),
        child: Row(
          children: [
            Text(
              'جديد  ',
              style:
                  AppStyles.styleBold16(context).copyWith(color: Colors.black),
            ),
            ClipOval(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                color: const Color(0XFFEBF9F1),
                child: Text(
                  '2',
                  style: AppStyles.styleBold13(context)
                      .copyWith(color: AppColors.kPrimaryColor),
                ),
              ),
            ),
            const Spacer(),
            Text(
              'تحديد الكل مقروء',
              style: AppStyles.styleRegular13(context)
                  .copyWith(color: const Color(0XFF949D9E)),
            )
          ],
        ),
      ),
    );
  }
}
