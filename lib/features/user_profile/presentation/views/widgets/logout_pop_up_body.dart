import 'package:advanced_ecommerce/core/Utils/app_styles.dart';
import 'package:advanced_ecommerce/features/user_profile/presentation/views/widgets/pop_up_logout_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class LogoutPopUpBody extends StatelessWidget {
  const LogoutPopUpBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 28),
            Text("هل ترغب في تسجيل الخروج ؟",
                textAlign: TextAlign.center,
                style: AppStyles.styleBold16(context)
                    .copyWith(color: const Color(0XFF0C0D0D))),
            const SizedBox(height: 32),
            Row(
              children: [
                Expanded(
                  child: PopUpLogoutButton(
                    text: 'تأكيد',
                    onTap: () {
                      Navigator.of(context).pop();
                      //here we trigger logout from cubit
                    },
                  ),
                ),
                const Gap(8),
                Expanded(
                  child: PopUpLogoutButton(
                    text: 'لا ارغب',
                    color: Colors.white,
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
        // Exit icon
        Positioned(
          top: 0,
          right: 0,
          child: InkWell(
            onTap: () => Navigator.of(context).pop(), // Close dialog
            child: const Icon(
              Icons.close,
              color: Color(0XFF0C0D0D),
            ),
          ),
        ),
      ],
    );
  }
}
