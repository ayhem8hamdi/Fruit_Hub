import 'package:advanced_ecommerce/core/Utils/app_styles.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

abstract class UiHandler {
  static const Color primaryColor = Color(0xFF1B5E37);

  static void showFlushBar(BuildContext context, String message,
      {bool isError = true}) {
    try {
      Flushbar(
        message: message,
        margin: const EdgeInsets.all(16),
        borderRadius: BorderRadius.circular(16),
        backgroundColor: isError ? primaryColor : Colors.green,
        duration: const Duration(seconds: 3),
        flushbarPosition: FlushbarPosition.BOTTOM,
        animationDuration: const Duration(milliseconds: 500),
        messageColor: Colors.white,
        icon: Icon(
          isError ? Icons.error_outline : Icons.check_circle_outline,
          color: Colors.white,
        ),
      ).show(context);
    } catch (e) {
      debugPrint('Error showing Flushbar: $e');
    }
  }

  static void showSuccessDialog(
    BuildContext context, {
    required String svgAssetPath,
    required String message,
    Duration duration = const Duration(milliseconds: 1300),
    Color backgroundColor = Colors.white,
  }) {
    try {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          final screenWidth = MediaQuery.of(context).size.width;

          Future.delayed(duration, () {
            Navigator.of(context, rootNavigator: true).pop();
          });

          return Dialog(
            backgroundColor: Colors.transparent,
            insetPadding: EdgeInsets.zero,
            elevation: 0,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              width: screenWidth,
              padding: const EdgeInsets.symmetric(horizontal: 90, vertical: 50),
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(4),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    svgAssetPath,
                    width: screenWidth * 0.3,
                  ),
                  const SizedBox(height: 29),
                  Text(
                    message,
                    textAlign: TextAlign.center,
                    style: AppStyles.styleBold16(context)
                        .copyWith(color: const Color(0XFF0C0D0D)),
                  ),
                ],
              ),
            ),
          );
        },
      );
    } catch (e) {
      debugPrint('Error showing success dialog: $e');
      showFlushBar(context, message, isError: false);
    }
  }
}
