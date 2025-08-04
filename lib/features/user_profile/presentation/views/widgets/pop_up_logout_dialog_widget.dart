import 'package:advanced_ecommerce/features/user_profile/presentation/views/widgets/logout_pop_up_body.dart';
import 'package:flutter/material.dart';

class PopUpDialogLogoutWidget {
  static void showLogoutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // Don't dismiss by tapping outside
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.symmetric(horizontal: 18),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
            ),
            child: const LogoutPopUpBody(),
          ),
        );
      },
    );
  }
}
