import 'dart:developer';

import 'package:advanced_ecommerce/features/auth/presentation/views/widgets/accept_terms_widget.dart';
import 'package:advanced_ecommerce/features/auth/presentation/views/widgets/number_custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:advanced_ecommerce/core/Utils/methods_helper.dart';
import 'package:advanced_ecommerce/features/auth/presentation/views/widgets/custom_password_field.dart';
import 'package:advanced_ecommerce/features/auth/presentation/views/widgets/custom_text_field.dart';
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
  final _phoneController = TextEditingController();

  bool _acceptedTerms = false;

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _onSignUpPressed() {
    MethodsHelper.handleSignUpSubmission(
      context: context,
      formKey: _formKey,
      acceptedTerms: _acceptedTerms,
      onSuccess: () {
        final phoneNumber = _phoneController.text.trim();
        log(phoneNumber);
        //call cubit here
      },
    );
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
          CustomNumberTextField(
              hintText: 'رقم الهاتف',
              validator: MethodsHelper.validatePhoneNumber,
              controller: _phoneController),
          const Gap(16),
          CustomPasswordTextField(
            hintText: 'كلمة المرور',
            controller: _passwordController,
            validator: MethodsHelper.validatePassword,
          ),
          const Gap(20),
          AcceptTermsWidget(
            isAccepted: _acceptedTerms,
            onChanged: (value) {
              setState(() {
                _acceptedTerms = value ?? false;
              });
            },
          ),
          const Gap(37),
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
