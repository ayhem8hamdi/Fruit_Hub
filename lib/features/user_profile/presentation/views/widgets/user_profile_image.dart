import 'dart:io';
import 'package:advanced_ecommerce/core/services/image_picker_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:advanced_ecommerce/core/Utils/app_assets.dart';
import 'package:image_picker/image_picker.dart';

class UserProfileImage extends StatefulWidget {
  const UserProfileImage({super.key});

  @override
  State<UserProfileImage> createState() => _UserProfileImageState();
}

class _UserProfileImageState extends State<UserProfileImage> {
  dynamic _image;
  final ImagePickerService _pickerService = ImagePickerService();

  Future<void> _pickImage() async {
    final XFile? picked = await _pickerService.pickImage();
    if (picked != null) {
      setState(() {
        _image = _pickerService.getImageFile(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final imageWidth = screenWidth * 0.211594203;

    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 60, maxWidth: 88),
      child: AspectRatio(
        aspectRatio: 1,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            ClipOval(
              child: _image != null
                  ? (kIsWeb
                      ? Image.network(_image!.path, fit: BoxFit.cover)
                      : Image.file(_image as File, fit: BoxFit.cover))
                  : Image.asset(
                      Assets.userProfileImage,
                      width: imageWidth,
                      fit: BoxFit.cover,
                    ),
            ),
            Positioned(
              bottom: -8,
              child: GestureDetector(
                onTap: _pickImage,
                child: Image.asset(Assets.cameraIcon),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
