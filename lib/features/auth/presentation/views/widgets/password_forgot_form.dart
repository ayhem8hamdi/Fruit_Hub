import 'package:advanced_ecommerce/core/Utils/app_router.dart';
import 'package:advanced_ecommerce/core/Utils/methods_helper.dart';
import 'package:advanced_ecommerce/features/auth/presentation/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:advanced_ecommerce/features/OnBoarding/presentation/views/widgets/on_boarding_button.dart';
import 'package:get/get.dart';

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({super.key});

  @override
  State<ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  void _onSendCodePressed() {
    final isValid = _formKey.currentState?.validate() ?? false;
    if (!isValid) return;
    final phoneNumber = _phoneController.text.trim();
    print(phoneNumber);
    Get.toNamed(AppRouter.recoverPasswordScreen);
    // Proceed with the forgot password flow using phoneNumber
    // call cubit function
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomBorderTextField(
            hintText: 'رقم الهاتف',
            controller: _phoneController,
            validator: MethodsHelper.validatePhoneNumber,
          ),
          const Gap(37),
          OnBoardingButton(
            isActive: true,
            text: 'إرسال رمز التحقق',
            onTap: _onSendCodePressed,
          ),
        ],
      ),
    );
  }
}
