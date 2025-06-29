import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:advanced_ecommerce/core/Utils/methods_helper.dart';
import 'package:advanced_ecommerce/features/auth/presentation/views/widgets/custom_password_field.dart';
import 'package:advanced_ecommerce/features/auth/presentation/views/widgets/custom_text_field.dart';
import 'package:advanced_ecommerce/features/auth/presentation/views/widgets/password_forgot_link.dart';
import 'package:advanced_ecommerce/features/OnBoarding/presentation/views/widgets/on_boarding_button.dart';

class SignUpTextFieldsForm extends StatefulWidget {
  const SignUpTextFieldsForm({super.key});

  @override
  State<SignUpTextFieldsForm> createState() => _SignUpTextFieldsFormState();
}

class _SignUpTextFieldsFormState extends State<SignUpTextFieldsForm> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onSignUpPressed() {
    if (_formKey.currentState?.validate() ?? false) {
      // Handle sign-up logic here or trigger cubit
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomBorderTextField(
            hintText: 'الاسم الكامل',
            controller: _fullNameController,
            validator: MethodsHelper.validateFullName,
          ),
          const Gap(16),
          CustomBorderTextField(
            hintText: 'البريد الإلكتروني',
            controller: _emailController,
            validator: MethodsHelper.validateEmail,
          ),
          const Gap(16),
          CustomPasswordTextField(
            hintText: 'كلمة المرور',
            controller: _passwordController,
            validator: MethodsHelper.validatePassword,
          ),
          const Gap(32),
          OnBoardingButton(
            isActive: true,
            text: 'إنشاء حساب',
            onTap: _onSignUpPressed,
          ),
        ],
      ),
    );
  }
}
