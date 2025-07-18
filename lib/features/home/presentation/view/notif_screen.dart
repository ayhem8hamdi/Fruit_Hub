import 'package:advanced_ecommerce/features/home/presentation/view/widgets/custom_bottom_nav_bar.dart';
import 'package:advanced_ecommerce/features/home/presentation/view/widgets/notif_screen_body.dart';
import 'package:flutter/material.dart';

class NotifScreen extends StatefulWidget {
  const NotifScreen({super.key});

  @override
  State<NotifScreen> createState() => _NotifScreenState();
}

class _NotifScreenState extends State<NotifScreen> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const NotifScreenBody(),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
      ),
    );
  }
}
