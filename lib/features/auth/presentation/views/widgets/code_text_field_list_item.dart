import 'package:advanced_ecommerce/features/auth/presentation/views/widgets/code_text_field.dart';
import 'package:flutter/material.dart';

class CodeTextFieldListItem extends StatelessWidget {
  const CodeTextFieldListItem({
    super.key,
    required List<TextEditingController> controllers,
    required this.index,
    required List<FocusNode> focusNodes,
  })  : _controllers = controllers,
        _focusNodes = focusNodes;

  final List<TextEditingController> _controllers;
  final int index;
  final List<FocusNode> _focusNodes;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CodeTextField(
        controller: _controllers[index],
        focusNode: _focusNodes[index],
        nextFocusNode: index > 0 ? _focusNodes[index - 1] : null,
      ),
    );
  }
}
