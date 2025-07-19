import 'package:advanced_ecommerce/core/Utils/app_assets.dart';
import 'package:flutter/material.dart';

class UserProfileImage extends StatelessWidget {
  const UserProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final imageWidth = screenWidth * 0.211594203;

    return ConstrainedBox(
      constraints: const BoxConstraints(
        minWidth: 60,
        maxWidth: 88,
      ),
      child: AspectRatio(
        aspectRatio: 1,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            ClipOval(
              child: Image.asset(
                Assets.userProfileImage,
                width: imageWidth,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(bottom: -8, child: Image.asset(Assets.cameraIcon)),
          ],
        ),
      ),
    );
  }
}
