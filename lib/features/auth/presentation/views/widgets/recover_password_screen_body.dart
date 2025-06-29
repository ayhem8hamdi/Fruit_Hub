import 'package:advanced_ecommerce/features/auth/presentation/views/widgets/code_text_field.dart';
import 'package:advanced_ecommerce/features/auth/presentation/views/widgets/custom_auth_appbar.dart';
import 'package:advanced_ecommerce/features/auth/presentation/views/widgets/password_forgot_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class RecoverPasswordScreenBody extends StatelessWidget {
  const RecoverPasswordScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomAuthAppbar(
              title: 'التحقق من الرمز',
            ),
            Gap(28),
            ForgotPasswordText(
                text:
                    ' أدخل الرمز الذي أرسلناه إلى عنوان بريد  التالي  Max***@gmail.com '),
            Gap(30),
            CodeFieldsWidget()
          ],
        ),
      ),
    );
  }
}

class CodeFieldsWidget extends StatelessWidget {
  const CodeFieldsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<TextEditingController> controllers =
        List.generate(4, (_) => TextEditingController());
    final List<FocusNode> focusNodes = List.generate(4, (_) => FocusNode());

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Row(
        children: List.generate(4 * 2 - 1, (index) {
          if (index.isOdd) {
            return const SizedBox(width: 15);
          } else {
            final fieldIndex = index ~/ 2;
            return Expanded(
              child: CodeTextField(
                controller: controllers[fieldIndex],
                focusNode: focusNodes[fieldIndex],
                nextFocusNode: fieldIndex > 0
                    ? focusNodes[fieldIndex - 1]
                    : null, // reverse order
              ),
            );
          }
        }),
      ),
    );
  }
}
