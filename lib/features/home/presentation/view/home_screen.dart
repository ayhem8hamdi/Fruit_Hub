import 'package:advanced_ecommerce/core/Utils/base_screen_with_nav.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseScreenWithNav(initialIndex: 1);
  }
}
