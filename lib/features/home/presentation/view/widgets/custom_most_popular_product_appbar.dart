import 'package:advanced_ecommerce/core/Utils/app_assets.dart';
import 'package:advanced_ecommerce/core/Utils/app_styles.dart';
import 'package:advanced_ecommerce/features/auth/presentation/views/widgets/custom_arrow_back.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class CustomMostPopularProductAppbar extends StatelessWidget {
  const CustomMostPopularProductAppbar({super.key, required this.title});
  final String title;
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
          const Align(
            alignment: Alignment.centerRight,
            child: AuthAppBarCustomIcon(),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: SvgPicture.asset(
              Assets.notifIcon,
              fit: BoxFit.fill,
            ),
          )
        ],
      ),
    );
  }
}
