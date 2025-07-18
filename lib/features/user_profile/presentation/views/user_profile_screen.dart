import 'package:advanced_ecommerce/core/Utils/custom_bottom_nav_bar.dart';
import 'package:advanced_ecommerce/features/user_profile/presentation/views/widgets/user_profile_screen_body.dart';
import 'package:flutter/material.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  int _currentIndex = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const UserProfileScreenBody(),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
      ),
    );
    ;
  }
}
