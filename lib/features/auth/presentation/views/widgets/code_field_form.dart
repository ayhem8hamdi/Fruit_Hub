import 'package:advanced_ecommerce/features/OnBoarding/presentation/views/widgets/on_boarding_button.dart';
import 'package:advanced_ecommerce/features/auth/presentation/views/widgets/code_text_field.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CodeFieldsForm extends StatefulWidget {
  const CodeFieldsForm({super.key, this.onSubmit});
  final VoidCallback? onSubmit;

  @override
  State<CodeFieldsForm> createState() => _CodeFieldsFormState();
}

class _CodeFieldsFormState extends State<CodeFieldsForm> {
  final _formKey = GlobalKey<FormState>();
  final List<TextEditingController> _controllers =
      List.generate(4, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());
  final double _fieldSpacing = 15.0;

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }
    for (final node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void _onSubmit() {
    if (_formKey.currentState?.validate() ?? false) {
      final code = _controllers.map((e) => e.text).join();
      debugPrint('Entered Code: $code');
      widget.onSubmit?.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          LayoutBuilder(
            builder: (context, constraints) {
              final totalSpacing = _fieldSpacing * 3;
              final availableWidth = constraints.maxWidth - totalSpacing;
              final fieldWidth = availableWidth / 4;

              return Directionality(
                textDirection: TextDirection.rtl,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(4, (index) {
                    return SizedBox(
                      width: fieldWidth,
                      child: CodeTextField(
                        controller: _controllers[index],
                        focusNode: _focusNodes[index],
                        nextFocusNode:
                            index > 0 ? _focusNodes[index - 1] : null,
                      ),
                    );
                  }),
                ),
              );
            },
          ),
          const Gap(24),
          OnBoardingButton(
            isActive: true,
            onTap: _onSubmit,
            text: 'تحقق',
          ),
        ],
      ),
    );
  }
}
