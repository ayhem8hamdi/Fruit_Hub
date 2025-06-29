import 'package:advanced_ecommerce/core/Utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AuthAppBarCustomIcon extends StatelessWidget {
  const AuthAppBarCustomIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (Navigator.canPop(context)) {
          Navigator.pop(context);
        }
      },
      child: SvgPicture.asset(Assets.arrowBackIcon),
    );
  }
}
