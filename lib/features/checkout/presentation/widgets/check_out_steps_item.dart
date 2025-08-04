import 'package:advanced_ecommerce/core/Utils/app_colors.dart';
import 'package:advanced_ecommerce/core/Utils/app_styles.dart';
import 'package:advanced_ecommerce/features/checkout/domain/entities/checkout_step_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class CheckOutStepsItem extends StatelessWidget {
  const CheckOutStepsItem({
    super.key,
    required this.checkoutStepModel,
  });
  final CheckoutStepModel checkoutStepModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(checkoutStepModel.stepIcon),
        const Gap(5),
        Text(
          checkoutStepModel.stepTitle,
          style: checkoutStepModel.isChecked == false
              ? AppStyles.styleSemiBold13(context)
                  .copyWith(color: const Color(0XFFAAAAAA))
              : AppStyles.styleBold13(context)
                  .copyWith(color: AppColors.kPrimaryColor),
        )
      ],
    );
  }
}
