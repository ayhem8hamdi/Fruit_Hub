import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

abstract class UiHandler {
  static const Color primaryColor = Color(0xFF1B5E37);

  static void showFlushBar(BuildContext context, String message,
      {bool isError = true}) {
    try {
      Flushbar(
        message: message,
        margin: const EdgeInsets.all(16),
        borderRadius: BorderRadius.circular(16),
        backgroundColor: isError ? primaryColor : Colors.green,
        duration: const Duration(seconds: 3),
        flushbarPosition: FlushbarPosition.BOTTOM,
        animationDuration: const Duration(milliseconds: 500),
        messageColor: Colors.white,
        icon: Icon(
          isError ? Icons.error_outline : Icons.check_circle_outline,
          color: Colors.white,
        ),
      ).show(context);
    } catch (e) {
      debugPrint('Error showing Flushbar: $e');
    }
  }
}
