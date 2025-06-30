import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CodeTextFieldController {
  final FocusNode focusNode;
  final FocusNode? nextFocusNode;

  bool _hasError = false;
  bool _hasFocus = false;

  final List<TextInputFormatter> inputFormatters = [
    FilteringTextInputFormatter.digitsOnly,
    LengthLimitingTextInputFormatter(1),
  ];

  VoidCallback? _listener;

  CodeTextFieldController({
    required this.focusNode,
    this.nextFocusNode,
    VoidCallback? listener,
  }) : _listener = listener {
    focusNode.addListener(_handleFocusChange);
  }

  bool get hasError => _hasError;
  bool get hasFocus => _hasFocus;

  void addListener(VoidCallback listener) {
    _listener = listener;
  }

  void removeListener(void Function() handleStateChange) {
    _listener = null;
  }

  void _notifyListener() {
    _listener?.call();
  }

  void _handleFocusChange() {
    _hasFocus = focusNode.hasFocus;

    if (!_hasFocus && _hasError) {
      _hasError = false;
      _notifyListener();
    }
  }

  void handleInput(String value, BuildContext context) {
    final trimmed = value.trim();

    if (trimmed.length == 1) {
      if (_hasError) {
        _hasError = false;
        _notifyListener();
      }
      if (nextFocusNode != null) {
        FocusScope.of(context).requestFocus(nextFocusNode);
      } else {
        focusNode.unfocus();
      }
    } else {
      if (!_hasError) {
        _hasError = true;
        _notifyListener();
      }
    }
  }

  String? validate(String? value) {
    final isValid = value != null && value.trim().length == 1;
    if (_hasError != !isValid) {
      _hasError = !isValid;
      _notifyListener();
    }
    return isValid ? null : '';
  }

  void dispose() {
    focusNode.removeListener(_handleFocusChange);
  }
}

class CodeTextFieldDecoration {
  static const defaultBorderRadius = 8.0;
  static const defaultBorderWidth = 1.4;
  static const focusedBorderWidth = 1.8;
  static const contentPadding = EdgeInsets.symmetric(vertical: 20);

  static const focusedColor = Color(0xFFF4A91F);
  static const fillColor = Color(0xFFF9FAFA);

  static TextStyle textStyle(bool hasFocus) {
    return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: hasFocus ? focusedColor : Colors.black,
    );
  }

  static InputDecoration build({
    required bool hasFocus,
    required bool hasError,
  }) {
    final borderColor = _getBorderColor(hasFocus, hasError);
    final borderWidth = hasFocus ? focusedBorderWidth : defaultBorderWidth;

    return InputDecoration(
      isDense: true,
      contentPadding: contentPadding,
      filled: true,
      fillColor: hasError ? Colors.red.withOpacity(0.1) : fillColor,
      hintText: '',
      helperText: ' ',
      helperStyle: const TextStyle(height: 0),
      errorStyle: const TextStyle(height: 0),
      enabledBorder: _outlineBorder(borderColor, borderWidth),
      focusedBorder: _outlineBorder(borderColor, focusedBorderWidth),
      errorBorder: _outlineBorder(borderColor, borderWidth),
      focusedErrorBorder: _outlineBorder(borderColor, focusedBorderWidth),
    );
  }

  static Color _getBorderColor(bool hasFocus, bool hasError) {
    if (hasFocus) return focusedColor;
    if (hasError) return Colors.red.withOpacity(0.5);
    return Colors.grey.shade300;
  }

  static OutlineInputBorder _outlineBorder(Color color, double width) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(defaultBorderRadius),
      borderSide: BorderSide(color: color, width: width),
    );
  }
}
