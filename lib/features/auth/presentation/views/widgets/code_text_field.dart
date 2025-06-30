import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  bool _hasError = false;
  bool _hasFocus = false;

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

  void _handleFocusChange() {
    setState(() {
      _hasFocus = widget.focusNode.hasFocus;

      // If field lost focus and has valid input, remove error and trigger rebuild
      if (!_hasFocus &&
          widget.controller.text.trim().length == 1 &&
          _hasError) {
        _hasError = false;
      }
    });
  }

  void _handleInput(String value) {
    final trimmed = value.trim();

    if (trimmed.length == 1) {
      if (_hasError) setState(() => _hasError = false);

      // Move to next field or unfocus
      if (widget.nextFocusNode != null) {
        FocusScope.of(context).requestFocus(widget.nextFocusNode);
      } else {
        widget.focusNode.unfocus();
      }
    } else {
      if (!_hasError) setState(() => _hasError = true);
    }
  }

  String? _validate(String? value) {
    final isValid = value != null && value.trim().length == 1;
    if (_hasError != !isValid) {
      setState(() => _hasError = !isValid);
    }
    return isValid ? null : '';
  }

  @override
  Widget build(BuildContext context) {
    final borderColor = () {
      if (_hasFocus) return const Color(0xFFF4A91F); // focused = orange
      if (_hasError) return Colors.red.withOpacity(0.5); // error
      return Colors.grey.shade300; // normal
    }();

    return TextFormField(
      controller: widget.controller,
      focusNode: widget.focusNode,
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(1),
      ],
      onChanged: _handleInput,
      validator: _validate,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: _hasFocus ? const Color(0xFFF4A91F) : Colors.black,
      ),
      decoration: InputDecoration(
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 20),
        filled: true,
        fillColor:
            _hasError ? Colors.red.withOpacity(0.1) : const Color(0xFFF9FAFA),
        hintText: '',
        helperText: ' ', // keep spacing
        helperStyle: const TextStyle(height: 0),
        errorStyle: const TextStyle(height: 0),
        enabledBorder: _outlineBorder(borderColor),
        focusedBorder: _outlineBorder(borderColor, width: 1.8),
        errorBorder: _outlineBorder(borderColor),
        focusedErrorBorder: _outlineBorder(borderColor, width: 1.8),
      ),
    );
  }

  OutlineInputBorder _outlineBorder(Color color, {double width = 1.4}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: color, width: width),
    );
  }
}
