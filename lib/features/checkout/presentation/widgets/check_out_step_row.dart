import 'package:advanced_ecommerce/core/Utils/app_assets.dart';
import 'package:advanced_ecommerce/features/checkout/domain/entities/checkout_step_model.dart';
import 'package:advanced_ecommerce/features/checkout/presentation/widgets/check_out_steps_item.dart';
import 'package:flutter/material.dart';

class CheckoutStepsRow extends StatelessWidget {
  const CheckoutStepsRow({super.key, required this.stepNumber});
  final int stepNumber;
  static final List<CheckoutStepModel> list = [
    CheckoutStepModel(
        stepTitle: 'الشحن',
        stepIcon: Assets.checkedCheckOutIcon,
        isChecked: true),
    CheckoutStepModel(
        stepTitle: 'العنوان',
        stepIcon: Assets.checkoutSecondStep,
        isChecked: false),
    CheckoutStepModel(
        stepTitle: 'الدفع',
        stepIcon: Assets.checkoutThirdStep,
        isChecked: false),
    CheckoutStepModel(
        stepTitle: 'المراجعه',
        stepIcon: Assets.checkoutLastStep,
        isChecked: false)
  ];
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
                4,
                (index) => CheckOutStepsItem(
                      checkoutStepModel: index <= stepNumber
                          ? list[index].copyWith(
                              stepIcon: Assets.checkedCheckOutIcon,
                              isChecked: true)
                          : list[index],
                    ))),
      ),
    );
  }
}
