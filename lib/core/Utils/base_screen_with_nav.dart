import 'package:advanced_ecommerce/core/Utils/Router/nested_routing.dart';
import 'package:advanced_ecommerce/core/Utils/custom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class BaseScreenWithNav extends StatefulWidget {
  const BaseScreenWithNav({super.key, required this.initialIndex});

  final int initialIndex;

  @override
  State<BaseScreenWithNav> createState() => _BaseScreenWithNavState();
}

class _BaseScreenWithNavState extends State<BaseScreenWithNav> {
  late int _currentIndex;

  final List<GlobalKey<NavigatorState>> _navigatorKeys = List.generate(
    4,
    (index) => GlobalKey<NavigatorState>(),
  );

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  Future<bool> _onWillPop() async {
    final isFirstRouteInCurrentTab =
        !(await _navigatorKeys[_currentIndex].currentState!.maybePop());

    if (isFirstRouteInCurrentTab && _currentIndex != 0) {
      setState(() => _currentIndex = 0);
      return false;
    }

    return isFirstRouteInCurrentTab;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: IndexedStack(
          index: _currentIndex,
          children: [
            BaseTabNavigator(
              navigatorKey: _navigatorKeys[0],
              initialRoute: BaseTabRoutes.home,
            ),
            BaseTabNavigator(
              navigatorKey: _navigatorKeys[1],
              initialRoute: BaseTabRoutes.products,
            ),
            BaseTabNavigator(
              navigatorKey: _navigatorKeys[2],
              initialRoute: BaseTabRoutes.cart,
            ),
            BaseTabNavigator(
              navigatorKey: _navigatorKeys[3],
              initialRoute: BaseTabRoutes.profile,
            ),
          ],
        ),
        bottomNavigationBar: CustomBottomNavBar(
          currentIndex: _currentIndex,
          onTap: (int index) {
            if (_currentIndex == index) {
              _navigatorKeys[index]
                  .currentState!
                  .popUntil((route) => route.isFirst);
            } else {
              setState(() => _currentIndex = index);
            }
          },
        ),
      ),
    );
  }
}
