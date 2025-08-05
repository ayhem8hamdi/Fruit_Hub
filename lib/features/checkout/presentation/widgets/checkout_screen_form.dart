import 'package:advanced_ecommerce/core/Utils/app_colors.dart';
import 'package:advanced_ecommerce/features/auth/presentation/views/widgets/accept_terms_text_widget.dart';
import 'package:advanced_ecommerce/features/auth/presentation/views/widgets/custom_text_field.dart';
import 'package:advanced_ecommerce/features/checkout/presentation/widgets/checkout_screen_custom_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CheckoutScreenForm extends StatelessWidget {
  const CheckoutScreenForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Transform.translate(
        offset: const Offset(0, -49),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const CustomBorderTextField(hintText: 'اسم حامل البطاقه'),
              const Gap(16),
              const CustomBorderTextField(hintText: 'رقم البطاقة'),
              const Gap(16),
              const Row(
                children: [
                  Expanded(
                      child: CustomBorderTextField(hintText: 'تاريخ الصلاحيه')),
                  Gap(16),
                  Expanded(child: CustomBorderTextField(hintText: 'CVV')),
                ],
              ),
              const Gap(16),
              const AcceptTermsWidget(isAddPaymentMethodCall: true),
              const Gap(50),
              CheckoutScreenCustomButton(
                text: 'تأكيد & استمرار',
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AcceptTermsWidget extends StatefulWidget {
  final bool isAddPaymentMethodCall;

  const AcceptTermsWidget({
    super.key,
    this.isAddPaymentMethodCall = false,
  });

  @override
  State<AcceptTermsWidget> createState() => _AcceptTermsWidgetState();
}

class _AcceptTermsWidgetState extends State<AcceptTermsWidget> {
  bool isAccepted = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _CustomCheckbox(
          value: isAccepted,
          onChanged: (value) {
            setState(() {
              isAccepted = value ?? false;
            });
          },
        ),
        const SizedBox(width: 10),
        Expanded(
          child: AcceptTermsTextWidget(
            isAddPaymentMethodCall: widget.isAddPaymentMethodCall,
          ),
        ),
      ],
    );
  }
}

class _CustomCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;

  const _CustomCheckbox({
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 24.0 / 18.0,
      child: Checkbox(
        value: value,
        onChanged: onChanged,
        visualDensity: VisualDensity.compact,
        activeColor: AppColors.kPrimaryColor,
        side: const BorderSide(
          color: Color(0xFFDDDFDF),
          width: 1.5,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
    );
  }
}
