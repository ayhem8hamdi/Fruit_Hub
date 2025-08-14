import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerService {
  final ImagePicker _picker = ImagePicker();

  /// Picks an image from gallery (mobile & web compatible)
  Future<XFile?> pickImage() async {
    try {
      return await _picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 800,
        maxHeight: 800,
        imageQuality: 80,
      );
    } catch (e) {
      debugPrint('Image picking error: $e');
      return null;
    }
  }

  /// Returns a File for mobile or XFile for web
  dynamic getImageFile(XFile? xfile) {
    if (xfile == null) return null;
    if (kIsWeb) return xfile; // Web uses XFile directly
    return File(xfile.path); // Mobile uses File
  }
}
