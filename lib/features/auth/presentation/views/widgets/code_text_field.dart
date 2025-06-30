import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:advanced_ecommerce/core/Utils/methods_helper.dart';

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
  bool get _isFocused => widget.focusNode.hasFocus;

  @override
  void initState() {
    super.initState();
    widget.focusNode.addListener(_handleFocusChange);
  }

  @override
  void dispose() {
    widget.focusNode.removeListener(_handleFocusChange);
    super.dispose();
  }

  void _handleFocusChange() => setState(() {});

  void _handleInput(String value) {
    if (value.length != 1) return;

    if (widget.nextFocusNode != null) {
      FocusScope.of(context).requestFocus(widget.nextFocusNode);
    } else {
      widget.focusNode.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      focusNode: widget.focusNode,
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(1),
      ],
      style: MethodsHelper.codeTextStyle(isFocused: _isFocused),
      onChanged: _handleInput,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 20),
        filled: true,
        fillColor: const Color(0xFFF9FAFA),
        enabledBorder: MethodsHelper.enabledFocusedBorder(),
        focusedBorder: MethodsHelper.orangeFocusedBorder(),
        errorBorder: MethodsHelper.errorBorder(),
        focusedErrorBorder: MethodsHelper.orangeFocusedBorder(),
        errorStyle: MethodsHelper.errorTextStyle(context),
      ),
      validator: MethodsHelper.validateSingleDigit,
    );
  }
}
