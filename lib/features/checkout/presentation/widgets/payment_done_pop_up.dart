import 'package:advanced_ecommerce/core/Utils/app_colors.dart';
import 'package:advanced_ecommerce/core/Utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class PaymentDonePopUp {
  static void showSuccessDialogWithAction(
    BuildContext context, {
    required String svgAssetPath,
    required String buttonLabel,
    required VoidCallback onPressed,
    Color backgroundColor = Colors.white,
  }) {
    try {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          final screenWidth = MediaQuery.of(context).size.width;

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
                  const SizedBox(height: 26),
                  Column(mainAxisSize: MainAxisSize.min, children: [
                    Text('تم بنجاح !',
                        style: AppStyles.styleBold13(context)
                            .copyWith(color: const Color(0XFF0C0D0D))),
                    const Gap(7),
                    Text('رقم الطلب : 1245789663#',
                        style: AppStyles.styleRegular13(context)
                            .copyWith(color: const Color(0XFF4E5556)))
                  ]),
                  const Gap(20),
                  GestureDetector(
                    child: Text(
                      buttonLabel,
                      style: AppStyles.styleBold16(context).copyWith(
                          decoration: TextDecoration.underline,
                          color: AppColors.kPrimaryColor),
                    ),
                    onTap: () {
                      Navigator.of(context, rootNavigator: true).pop();
                      onPressed();
                    },
                  ),
                ],
              ),
            ),
          );
        },
      );
    } catch (e) {
      debugPrint('Error showing success dialog: $e');
    }
  }
}
