import 'package:advanced_ecommerce/core/Utils/app_styles.dart';
import 'package:advanced_ecommerce/features/user_profile/presentation/views/widgets/user_profile_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class UserProfileAccountInfoRow extends StatelessWidget {
  const UserProfileAccountInfoRow({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            const UserProfileImage(),
            const Gap(24),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "أحمد ياسر",
                    style: AppStyles.styleBold13(context)
                        .copyWith(color: const Color(0XFF131F46)),
                  ),
                  const Gap(4),
                  Text(
                    'mail@mail.com',
                    style: AppStyles.styleRegular13(context)
                        .copyWith(color: const Color(0XFF888FA0)),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
