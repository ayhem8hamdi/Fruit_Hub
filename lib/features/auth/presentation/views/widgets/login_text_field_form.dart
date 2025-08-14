import 'package:advanced_ecommerce/core/Utils/methods_helper.dart';
import 'package:advanced_ecommerce/features/auth/presentation/manager/login_cubit/cubit/login_cubit_cubit.dart';
import 'package:advanced_ecommerce/features/auth/presentation/views/widgets/login_button_bloc_consumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:advanced_ecommerce/features/auth/presentation/views/widgets/custom_password_field.dart';
import 'package:advanced_ecommerce/features/auth/presentation/views/widgets/custom_text_field.dart';
import 'package:advanced_ecommerce/features/auth/presentation/views/widgets/password_forgot_link.dart';

class LoginTextFieldsForm extends StatefulWidget {
  const LoginTextFieldsForm({super.key});

  @override
  State<LoginTextFieldsForm> createState() => _LoginTextFieldsFormState();
}

class _LoginTextFieldsFormState extends State<LoginTextFieldsForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onLoginPressed() {
    if (_formKey.currentState?.validate() ?? false) {
      final email = _emailController.text.trim();
      final password = _passwordController.text.trim();
      context.read<LoginCubitCubit>().loginUserWithEmailAndPassword(
            email: email,
            password: password,
          );
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
          const Gap(20),
          const PasswordForgotNavLink(),
          const Gap(37),
          LoginButtonBlocConsumer(
            text: 'تسجيل دخول',
            onLoginPressed: _onLoginPressed,
          )
        ],
      ),
    );
  }
}
