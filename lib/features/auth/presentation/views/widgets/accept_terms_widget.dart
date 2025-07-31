import 'package:advanced_ecommerce/core/Utils/app_colors.dart';
import 'package:advanced_ecommerce/features/auth/presentation/views/widgets/accept_terms_text_widget.dart';
import 'package:flutter/material.dart';

class AcceptTermsWidget extends StatelessWidget {
  final bool isAccepted;
  final ValueChanged<bool?> onChanged;
  final bool isAddPaymentMethodCall;
  const AcceptTermsWidget(
      {super.key,
      required this.isAccepted,
      required this.onChanged,
      this.isAddPaymentMethodCall = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _CustomCheckbox(
          value: isAccepted,
          onChanged: onChanged,
        ),
        const SizedBox(width: 16),
        Expanded(
            child: AcceptTermsTextWidget(
          isAddPaymentMethodCall: isAddPaymentMethodCall,
        )),
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
