import 'package:advanced_ecommerce/core/Utils/app_assets.dart';
import 'package:advanced_ecommerce/core/Utils/responsive_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PaymentMethodsIconsRow extends StatelessWidget {
  const PaymentMethodsIconsRow({super.key});
  static final List<String> list = [
    Assets.paypalIcon,
    Assets.redOrangePaymentIcon,
    Assets.visaIcon,
    Assets.appelPaymentIcon,
  ];
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Transform.translate(
        offset: const Offset(10, -7),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
              list.length,
              (index) => Flexible(
                child: Padding(
                  padding: EdgeInsets.only(left: index == 2 ? 13 : 0),
                  child: ResponsiveImage(
                    fit: BoxFit.none,
                    imageDesignWidth: 67,
                    screenDesignWidth: 43,
                    imageDesignAspectRatio: 43 / 67,
                    customImageWidget: SvgPicture.asset(
                      list[index],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
