import 'package:advanced_ecommerce/core/Utils/app_assets.dart';
import 'package:advanced_ecommerce/features/home/presentation/view/widgets/custom_curved_container.dart';
import 'package:advanced_ecommerce/features/home/presentation/view/widgets/custom_search_text_field.dart';
import 'package:advanced_ecommerce/features/home/presentation/view/widgets/home_screen_user_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        HomeScreenUserListTile(),
        Gap(16),
        CustomSearchTextField(hintText: 'ابحث عن.......'),
        Gap(12),
        CurvedAdBanner()
      ],
    );
  }
}

class CurvedAdBanner extends StatelessWidget {
  const CurvedAdBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: AspectRatio(
        aspectRatio: 342 / 158,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                Assets.fruits,
                fit: BoxFit.cover,
              ),
              const Align(
                alignment: Alignment.centerRight,
                child: CustomCurvedContainer(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
