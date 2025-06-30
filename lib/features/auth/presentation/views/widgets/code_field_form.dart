import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:advanced_ecommerce/features/OnBoarding/presentation/views/widgets/on_boarding_button.dart';
import 'package:advanced_ecommerce/features/auth/presentation/views/widgets/code_text_field.dart';

class CodeFieldsForm extends StatefulWidget {
  const CodeFieldsForm({
    super.key,
    this.onSubmit,
    this.fieldCount = 4,
  });

  final VoidCallback? onSubmit;
  final int fieldCount;

  @override
  State<CodeFieldsForm> createState() => _CodeFieldsFormState();
}

class _CodeFieldsFormState extends State<CodeFieldsForm> {
  late final List<TextEditingController> _controllers;
  late final List<FocusNode> _focusNodes;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _controllers =
        List.generate(widget.fieldCount, (_) => TextEditingController());
    _focusNodes = List.generate(widget.fieldCount, (_) => FocusNode());
  }

  @override
  void dispose() {
    for (final c in _controllers) {
      c.dispose();
    }
    for (final n in _focusNodes) {
      n.dispose();
    }
    super.dispose();
  }

  void _onSubmit() {
    if (_formKey.currentState?.validate() ?? false) {
      final code = _controllers.map((c) => c.text).join();
      debugPrint('Entered Code: $code');
      // we could call cubit function here
      widget.onSubmit?.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Directionality(
            textDirection: TextDirection.rtl,
            child: Row(
              children: List.generate(widget.fieldCount * 2 - 1, (i) {
                if (i.isOdd) {
                  return const SizedBox(width: 16);
                }
                final index = i ~/ 2;
                return Expanded(
                  child: CodeTextField(
                    controller: _controllers[index],
                    focusNode: _focusNodes[index],
                    nextFocusNode: index > 0 ? _focusNodes[index - 1] : null,
                  ),
                );
              }),
            ),
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
