import 'package:advanced_ecommerce/core/Utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ProductDetailsCustomAppBar extends StatelessWidget {
  const ProductDetailsCustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.only(right: 16),
      child: GestureDetector(
          onTap: () => Get.back(),
          child: SvgPicture.asset(Assets.arrowBackIcon)),
    ));
  }
}
