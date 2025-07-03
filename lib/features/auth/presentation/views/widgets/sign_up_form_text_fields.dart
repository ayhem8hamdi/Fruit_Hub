import 'dart:developer';
import 'package:advanced_ecommerce/features/auth/presentation/manager/signup_cubit/cubit/sign_up_cubit.dart';
import 'package:advanced_ecommerce/features/auth/presentation/views/widgets/accept_terms_widget.dart';
import 'package:advanced_ecommerce/features/auth/presentation/views/widgets/number_custom_text_field.dart';
import 'package:advanced_ecommerce/features/auth/presentation/views/widgets/sign_up_button_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:advanced_ecommerce/core/Utils/methods_helper.dart';
import 'package:advanced_ecommerce/features/auth/presentation/views/widgets/custom_password_field.dart';
import 'package:advanced_ecommerce/features/auth/presentation/views/widgets/custom_text_field.dart';

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
        final fullName = _fullNameController.text.trim();
        final email = _emailController.text.trim();
        final password = _passwordController.text.trim();
        final phoneNumber = _phoneController.text.trim();
        log(phoneNumber);
        context.read<SignUpCubit>().createUserWithEmailAndPassword(
              email: email,
              password: password,
              fullName: fullName,
              phoneNumber: phoneNumber,
            );
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
          SignUpButtonBlocBuilder(
            onSignUpPressed: _onSignUpPressed,
          )
        ],
      ),
    );
  }
}
