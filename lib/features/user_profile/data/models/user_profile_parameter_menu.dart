import 'package:flutter/material.dart';

class UserProfileParameterMenu {
  final String title;
  final String image;
  final VoidCallback onTap;

  UserProfileParameterMenu(
      {required this.title, required this.image, required this.onTap});
}
