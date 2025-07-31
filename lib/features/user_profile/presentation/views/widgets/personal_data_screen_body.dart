import 'dart:developer';

import 'package:advanced_ecommerce/core/Utils/app_styles.dart';
import 'package:advanced_ecommerce/core/Utils/methods_helper.dart';
import 'package:advanced_ecommerce/features/OnBoarding/presentation/views/widgets/on_boarding_button.dart';
import 'package:advanced_ecommerce/features/auth/presentation/views/widgets/custom_password_field.dart';
import 'package:advanced_ecommerce/features/card_and_products_details/presentation/views/widgets/custom_card_appbar.dart';
import 'package:advanced_ecommerce/features/user_profile/presentation/views/widgets/custom_personal_data_text_field.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class PersonalDataScreenBody extends StatelessWidget {
  const PersonalDataScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: CustomScrollView(
        slivers: [
          CustomCardAppBar(
            title: 'الملف الشخصي',
          ),
          SliverGap(24),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: PersonalDataForm(),
            ),
          )
        ],
      ),
    );
  }
}

class PersonalDataForm extends StatefulWidget {
  const PersonalDataForm({super.key});

  @override
  State<PersonalDataForm> createState() => _PersonalDataFormState();
}

class _PersonalDataFormState extends State<PersonalDataForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  void onSaveChangesPressed() {
    if (_formKey.currentState?.validate() ?? false) {
      final email = _emailController.text.trim();
      final password = _nameController.text.trim();
      log('$email $password');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'المعلومات الشخصيه',
            style: AppStyles.styleSemiBold13(context)
                .copyWith(color: Colors.black),
          ),
          const Gap(8),
          CustomPersonalDataTextField(
              hintText: 'أحمد ياسر',
              controller: _nameController,
              isItInProfileData: true),
          const Gap(8),
          CustomPersonalDataTextField(
              hintText: 'ahmedyacer@gmail.com',
              controller: _emailController,
              isItInProfileData: true),
          const Gap(16),
          Text(
            'تغيير كلمة المرور',
            style: AppStyles.styleSemiBold13(context)
                .copyWith(color: Colors.black),
          ),
          const Gap(8),
          const CustomPasswordTextField(
            hintText: 'كلمة المرور الحالي',
          ),
          const Gap(8),
          const CustomPasswordTextField(
            hintText: 'كلمة المرور الجديده',
          ),
          const Gap(8),
          const CustomPasswordTextField(hintText: 'تأكيد كلمة المرور الجديده'),
          const Gap(70),
          OnBoardingButton(
            text: 'حفظ التغييرات',
            onTap: onSaveChangesPressed,
          )
        ],
      ),
    );
  }
}
