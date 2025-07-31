import 'package:advanced_ecommerce/core/Utils/app_colors.dart';
import 'package:advanced_ecommerce/core/Utils/app_styles.dart';
import 'package:flutter/material.dart';

class AcceptTermsTextWidget extends StatelessWidget {
  const AcceptTermsTextWidget({super.key, this.isAddPaymentMethodCall = false});
  final bool isAddPaymentMethodCall;
  @override
  Widget build(BuildContext context) {
    return isAddPaymentMethodCall == false
        ? Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'من خلال إنشاء حساب ، فإنك توافق على ',
                  style: AppStyles.styleSemiBold13(context).copyWith(
                    height: 1.7,
                    color: AppColors.kSecondaryColor,
                  ),
                ),
                TextSpan(
                  text: 'الشروط والأحكام الخاصة بنا',
                  style: AppStyles.styleSemiBold13(context).copyWith(
                    height: 1.7,
                    color: const Color(0xFF2D9F5D),
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.start,
          )
        : Text(
            'جعل البطاقة افتراضية',
            style: AppStyles.styleSemiBold13(context)
                .copyWith(color: const Color(0XFF616A6B)),
          );
  }
}
