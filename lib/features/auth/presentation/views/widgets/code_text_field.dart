import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:advanced_ecommerce/core/Utils/methods_helper.dart';

class CodeTextField extends StatefulWidget {
  const CodeTextField({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.nextFocusNode,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final FocusNode? nextFocusNode;

  @override
  State<CodeTextField> createState() => _CodeTextFieldState();
}

class _CodeTextFieldState extends State<CodeTextField> {
  late bool isFocused;

  @override
  void initState() {
    super.initState();
    isFocused = false;

    widget.focusNode.addListener(() {
      setState(() {
        isFocused = widget.focusNode.hasFocus;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      focusNode: widget.focusNode,
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(1),
      ],
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: isFocused ? Colors.orange : Colors.black,
      ),
      onChanged: (value) {
        if (value.length == 1) {
          if (widget.nextFocusNode != null) {
            // RTL: move focus to the previous node
            FocusScope.of(context).requestFocus(widget.nextFocusNode);
          } else {
            // Last field — unfocus
            widget.focusNode.unfocus();
          }
        }
      },
      decoration: InputDecoration(
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 20),
        hintText: '',
        hintStyle: const TextStyle(color: Colors.grey),
        filled: true,
        fillColor: const Color(0xFFF9FAFA),
        enabledBorder: MethodsHelper.enabledFocusedBorder(),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.orange, width: 1.8),
        ),
        errorBorder: MethodsHelper.errorBorder(),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.orange, width: 1.8),
        ),
        errorStyle: MethodsHelper.errorTextStyle(context),
      ),
      validator: (value) {
        if (value == null || value.isEmpty || value.length != 1) {
          return '';
        }
        return null;
      },
    );
  }
}
