import 'dart:developer';

import 'package:advanced_ecommerce/core/Utils/methods_helper.dart';
import 'package:advanced_ecommerce/features/OnBoarding/presentation/views/widgets/on_boarding_button.dart';
import 'package:advanced_ecommerce/features/auth/presentation/views/widgets/accept_terms_widget.dart';
import 'package:advanced_ecommerce/features/auth/presentation/views/widgets/custom_text_field.dart';
import 'package:advanced_ecommerce/features/auth/presentation/views/widgets/number_custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AddPaymentMethodForm extends StatefulWidget {
  const AddPaymentMethodForm({super.key});
  @override
  State<AddPaymentMethodForm> createState() => _AddPaymentMethodFormState();
}

class _AddPaymentMethodFormState extends State<AddPaymentMethodForm> {
  final _formKey = GlobalKey<FormState>();
  final _cardOwnerController = TextEditingController();
  final _validDateController = TextEditingController();
  final _cvvController = TextEditingController();
  final _cardNumberController = TextEditingController();
  bool _acceptedTerms = false;
  @override
  void dispose() {
    _cardOwnerController.dispose();
    _validDateController.dispose();
    _cvvController.dispose();
    _cardNumberController.dispose();
    super.dispose();
  }

  void onAddPaymentMethodPressed() {
    MethodsHelper.handleSignUpSubmission(
      context: context,
      formKey: _formKey,
      acceptedTerms: _acceptedTerms,
      onSuccess: () {
        final cardOwner = _cardOwnerController.text.trim();
        final cardNumber = _cardNumberController.text.trim();
        final validityDate = _validDateController.text.trim();
        final cvv = _cvvController.text.trim();

        log('$cardOwner $cardNumber $cvv $validityDate $_acceptedTerms');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomBorderTextField(
              hintText: 'اسم حامل البطاقه',
              controller: _cardOwnerController,
            ),
            const Gap(16),
            CustomBorderTextField(
              hintText: 'رقم البطاقة',
              controller: _cardNumberController,
            ),
            const Gap(16),
            Row(
              children: [
                Expanded(
                  child: CustomNumberTextField(
                      hintText: 'تاريخ الصلاحيه',
                      controller: _validDateController),
                ),
                const Gap(16),
                Expanded(
                  child: CustomNumberTextField(
                    hintText: 'CVV',
                    controller: _cvvController,
                  ),
                ),
              ],
            ),
            const Gap(16),
            AcceptTermsWidget(
              isAddPaymentMethodCall: true,
              isAccepted: _acceptedTerms,
              onChanged: (value) {
                setState(() {
                  _acceptedTerms = value ?? false;
                });
              },
            ),
            const Spacer(),
            const OnBoardingButton(
              text: ' +  أضف وسيلة دفع جديده',
            ),
            const Gap(80)
          ],
        ),
      ),
    );
  }
}
