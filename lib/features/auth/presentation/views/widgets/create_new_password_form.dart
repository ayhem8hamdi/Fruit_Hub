import 'dart:developer';
import 'package:advanced_ecommerce/core/Utils/app_assets.dart';
import 'package:advanced_ecommerce/core/Utils/methods_helper.dart';
import 'package:advanced_ecommerce/core/Utils/ui_errors_handler.dart';
import 'package:advanced_ecommerce/features/OnBoarding/presentation/views/widgets/on_boarding_button.dart';
import 'package:advanced_ecommerce/features/auth/presentation/views/widgets/custom_password_field.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CreateNewPasswordForm extends StatefulWidget {
  const CreateNewPasswordForm({super.key});

  @override
  State<CreateNewPasswordForm> createState() => _CreateNewPasswordFormState();
}

class _CreateNewPasswordFormState extends State<CreateNewPasswordForm> {
  final _formKey = GlobalKey<FormState>();

  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _onSubmit() {
    if (_formKey.currentState?.validate() ?? false) {
      log('New password: ${_passwordController.text}');
      //trigger the cubit here
      UiHandler.showSuccessDialog(context,
          svgAssetPath: Assets.passwordChange,
          message: 'تم تغيير الباسورد بنجاح');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomPasswordTextField(
            hintText: 'كلمة المرور الجديدة',
            controller: _passwordController,
            validator: MethodsHelper.validatePassword,
          ),
          const Gap(16),
          CustomPasswordTextField(
            hintText: 'إعادة كلمة المرور الجديدة',
            controller: _confirmPasswordController,
            validator: (value) => MethodsHelper.validateConfirmPassword(
              value,
              _passwordController.text,
            ),
          ),
          const Gap(37),
          OnBoardingButton(
            onTap: _onSubmit,
            isActive: true,
            text: 'تحديث كلمة المرور',
          ),
        ],
      ),
    );
  }
}
