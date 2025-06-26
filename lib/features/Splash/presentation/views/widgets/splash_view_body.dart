import 'package:advanced_ecommerce/core/Utils/app_assets.dart';
import 'package:advanced_ecommerce/core/Utils/app_router.dart';
import 'package:advanced_ecommerce/features/Splash/presentation/views/widgets/fade_animated_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 3900),
        () => Get.offNamed(AppRouter.onBoardingScreen));
  }

  Widget build(BuildContext context) {
    return AnimatedFadeWidget(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset(Assets.splashUpperPlant),
              ],
            ),
            SvgPicture.asset(Assets.logo),
            SvgPicture.asset(
              Assets.splashBottomSection,
              fit: BoxFit.fill,
            ),
          ],
        ),
      ),
    );
  }
}
