import 'package:advanced_ecommerce/core/Utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(Assets.splash_upper_plant),
          ],
        ),
        SvgPicture.asset(Assets.logo),
        Padding(
          padding: const EdgeInsets.only(bottom: 5, right: 5, left: 5),
          child: SvgPicture.asset(
            Assets.splash_bottom_section,
            fit: BoxFit.fill,
          ),
        ),
      ],
    );
  }
}
