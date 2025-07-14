import 'package:advanced_ecommerce/core/Utils/app_colors.dart';
import 'package:advanced_ecommerce/core/Utils/app_styles.dart';
import 'package:advanced_ecommerce/features/home/presentation/view/widgets/custom_search_text_field.dart';
import 'package:advanced_ecommerce/features/home/presentation/view/widgets/home_screen_user_list_tile.dart';
import 'package:advanced_ecommerce/features/home/presentation/view/widgets/soft_left_curve_clipper.dart';
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
        CustomCurvedContainer()
      ],
    );
  }
}

class CustomCurvedContainer extends StatelessWidget {
  const CustomCurvedContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: SoftLeftCurveClipper(),
      child: Container(
        color: const Color(0XFF5DB957),
        padding:
            const EdgeInsets.only(right: 27, top: 29, bottom: 29, left: 37),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'عروض العيد',
              style: AppStyles.styleRegular13(context),
            ),
            const Gap(12),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                      text: 'خصم ',
                      style: AppStyles.styleBold19(context)
                          .copyWith(color: const Color(0XFFFFFFFF))),
                  TextSpan(
                      text: '25%',
                      style: AppStyles.styleBold19(context)
                          .copyWith(color: const Color(0XFFFFFFFF))),
                ],
              ),
            ),
            const SizedBox(height: 15),
            const CustomDiscountButton()
          ],
        ),
      ),
    );
  }
}

class CustomDiscountButton extends StatelessWidget {
  const CustomDiscountButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 8),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(4)),
      child: Text(
        'تسوق الان',
        style: AppStyles.styleBold13(context)
            .copyWith(color: AppColors.kPrimaryColor),
      ),
    ));
  }
}
