import 'package:advanced_ecommerce/core/Utils/custom_bottom_nav_bar.dart';
import 'package:advanced_ecommerce/features/home/presentation/view/widgets/home_screen_body.dart';
import 'package:advanced_ecommerce/features/home/presentation/view/widgets/most_popular_product_screen_body.dart';
import 'package:advanced_ecommerce/features/home/presentation/view/widgets/products_screen_body.dart';
import 'package:advanced_ecommerce/features/card_and_products_details/presentation/views/widgets/card_screen_body.dart';
import 'package:advanced_ecommerce/features/notifications/presentation/views/widgets/notif_screen_body.dart';
import 'package:advanced_ecommerce/features/search/presentaion/views/widgets/search_screen_body.dart';
import 'package:advanced_ecommerce/features/user_profile/presentation/views/widgets/personal_data_screen_body.dart';
import 'package:advanced_ecommerce/features/user_profile/presentation/views/widgets/user_profile_screen_body.dart';
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

    if (isFirstRouteInCurrentTab) {
      if (_currentIndex != 0) {
        setState(() => _currentIndex = 0);
        return false;
      }
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
            _buildTabNavigator(0, '/tab/home'),
            _buildTabNavigator(1, '/tab/products'),
            _buildTabNavigator(2, '/tab/cart'),
            _buildTabNavigator(3, '/tab/profile'),
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
              setState(() {
                _currentIndex = index;
              });
            }
          },
        ),
      ),
    );
  }

  Widget _buildTabNavigator(int index, String initialRoute) {
    return Navigator(
      key: _navigatorKeys[index],
      initialRoute: initialRoute,
      onGenerateRoute: (RouteSettings settings) {
        WidgetBuilder builder;

        switch (settings.name) {
          // HOME tab
          case '/tab/home':
            builder = (_) => const Scaffold(body: HomeScreenBody());
            break;

          case '/tab/home/mostPopular':
            builder =
                (_) => const Scaffold(body: MostPopularProductScreenBody());
            break;

          case '/tab/home/mostPopular/notifScreen':
            builder = (_) => const Scaffold(body: NotifScreenBody());
            break;

          case '/tab/home/notifScreen':
            builder = (_) => const Scaffold(body: NotifScreenBody());
            break;

          case '/tab/home/searchScreen':
            builder = (_) => const Scaffold(body: SearchScreenBody());
            break;

          // PRODUCTS tab
          case '/tab/products':
            builder = (_) => const Scaffold(body: ProductsScreenBody());
            break;

          // CART tab
          case '/tab/cart':
            builder = (_) => const Scaffold(body: CardScreenBody());
            break;

          // PROFILE tab
          case '/tab/profile':
            builder = (_) => const Scaffold(body: UserProfileScreenBody());
            break;
          case '/tab/profile/personalData':
            builder = (_) => const Scaffold(body: PersonalDataScreenBody());
            break;

          default:
            builder = (_) => const Scaffold(
                body: Center(child: Text('Unknown Route Inside Tab')));
        }

        return MaterialPageRoute(
          builder: builder,
          settings: settings,
        );
      },
    );
  }
}
