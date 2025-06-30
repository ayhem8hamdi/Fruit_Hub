import 'package:advanced_ecommerce/features/auth/presentation/views/widgets/code_text_field_controllers.dart';
import 'package:flutter/material.dart';

class CodeTextField extends StatefulWidget {
  const CodeTextField({
    super.key,
    required this.controller,
    required this.focusNode,
    this.nextFocusNode,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final FocusNode? nextFocusNode;

  @override
  State<CodeTextField> createState() => _CodeTextFieldState();
}

class _CodeTextFieldState extends State<CodeTextField> {
  late final CodeTextFieldController _fieldController;

  @override
  void initState() {
    super.initState();
    _fieldController = CodeTextFieldController(
      focusNode: widget.focusNode,
      nextFocusNode: widget.nextFocusNode,
    );
    _fieldController.addListener(_handleStateChange);
  }

  @override
  void dispose() {
    _fieldController.removeListener(_handleStateChange);
    _fieldController.dispose();
    super.dispose();
  }

  void _handleStateChange() => setState(() {});

  void _handleInput(String value) =>
      _fieldController.handleInput(value, context);

  String? _validate(String? value) => _fieldController.validate(value);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      focusNode: widget.focusNode,
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
      inputFormatters: _fieldController.inputFormatters,
      onChanged: _handleInput,
      validator: _validate,
      style: CodeTextFieldDecoration.textStyle(_fieldController.hasFocus),
      decoration: CodeTextFieldDecoration.build(
        hasFocus: _fieldController.hasFocus,
        hasError: _fieldController.hasError,
      ),
    );
  }
}
