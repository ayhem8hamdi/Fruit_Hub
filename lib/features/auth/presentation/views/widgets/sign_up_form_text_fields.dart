import 'package:advanced_ecommerce/core/Utils/app_colors.dart';
import 'package:advanced_ecommerce/core/Utils/app_styles.dart';
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

  bool _acceptedTerms = false;

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onSignUpPressed() {
    MethodsHelper.handleSignUpSubmission(
      context: context,
      formKey: _formKey,
      acceptedTerms: _acceptedTerms,
      onSuccess: () {
        // Put sign-up logic here or call cubit/Bloc
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

class AcceptTermsWidget extends StatelessWidget {
  final bool isAccepted;
  final ValueChanged<bool?> onChanged;

  const AcceptTermsWidget({
    super.key,
    required this.isAccepted,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _CustomCheckbox(
          value: isAccepted,
          onChanged: onChanged,
        ),
        const SizedBox(width: 16),
        Expanded(child: const AcceptTermsTextWidget()),
      ],
    );
  }
}

class AcceptTermsTextWidget extends StatelessWidget {
  const AcceptTermsTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'من خلال إنشاء حساب ، فإنك توافق على ',
            style: AppStyles.styleSemiBold13(context).copyWith(
              height: 1.7,
              color: AppColors.kSecondaryColor,
            ),
          ),
          TextSpan(
            text: 'الشروط والأحكام الخاصة بنا',
            style: AppStyles.styleSemiBold13(context).copyWith(
              height: 1.7,
              color: const Color(0xFF2D9F5D),
            ),
          ),
        ],
      ),
      textAlign: TextAlign.start,
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
