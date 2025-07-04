import 'package:advanced_ecommerce/core/Utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void configLoading() {
  EasyLoading.instance
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.white
    ..backgroundColor = AppColors.kPrimaryColor
    ..indicatorColor = Colors.white
    ..textColor = Colors.white
    ..maskColor = AppColors.kPrimaryColor.withOpacity(0.4)
    ..userInteractions = false
    ..dismissOnTap = false;
}
