import 'package:advanced_ecommerce/core/Utils/app_assets.dart';
import 'package:advanced_ecommerce/core/Utils/app_styles.dart';
import 'package:advanced_ecommerce/features/auth/presentation/views/widgets/custom_arrow_back.dart';
import 'package:flutter/material.dart';

class CustomAuthAppbar extends StatelessWidget {
  const CustomAuthAppbar(
      {super.key, this.isCardAppBar = false, required this.title});
  final String title;
  final bool isCardAppBar;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              title,
              style: AppStyles.styleBold19(context),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: isCardAppBar == false
                ? const AuthAppBarCustomIcon()
                : GestureDetector(
                    onTap: () {
                      if (Navigator.canPop(context)) {
                        Navigator.pop(context);
                      }
                    },
                    child: Image.asset(Assets.unborderedBackArrow)),
          ),
        ],
      ),
    );
  }
}
