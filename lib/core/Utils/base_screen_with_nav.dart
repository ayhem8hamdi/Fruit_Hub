import 'package:advanced_ecommerce/core/Utils/custom_bottom_nav_bar.dart';
import 'package:advanced_ecommerce/features/home/presentation/view/widgets/home_screen_body.dart';
import 'package:advanced_ecommerce/features/user_profile/presentation/views/widgets/user_profile_screen_body.dart';
import 'package:flutter/material.dart';

class BaseScreenWithNav extends StatefulWidget {
  const BaseScreenWithNav({
    super.key,
    required this.initialIndex,
  });

  final int initialIndex;

  @override
  State<BaseScreenWithNav> createState() => _BaseScreenWithNavState();
}

class _BaseScreenWithNavState extends State<BaseScreenWithNav> {
  late int _currentIndex;

  final List<Widget> _screens = const [
    HomeScreenBody(),
    Center(
      child: Text('Product'),
    ),
    Center(
      child: Text('Cart'),
    ), // CartScreen
    UserProfileScreenBody()
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
