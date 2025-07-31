import 'package:advanced_ecommerce/core/Utils/custom_bottom_nav_bar.dart';
import 'package:advanced_ecommerce/features/card_and_products_details/presentation/views/widgets/card_screen_body.dart';
import 'package:advanced_ecommerce/features/home/presentation/view/widgets/home_screen_body.dart';
import 'package:advanced_ecommerce/features/home/presentation/view/widgets/most_popular_product_screen_body.dart';
import 'package:advanced_ecommerce/features/home/presentation/view/widgets/products_screen_body.dart';
import 'package:advanced_ecommerce/features/notifications/presentation/views/widgets/notif_screen_body.dart';
import 'package:advanced_ecommerce/features/search/presentaion/views/widgets/search_screen_body.dart';
import 'package:advanced_ecommerce/features/user_profile/presentation/views/widgets/payment_methods_screen_body.dart';
import 'package:advanced_ecommerce/features/user_profile/presentation/views/widgets/personal_data_screen_body.dart';
import 'package:advanced_ecommerce/features/user_profile/presentation/views/widgets/user_profile_screen_body.dart';
import 'package:flutter/material.dart';

class BaseTabRoutes {
  // Home Tab
  static const String home = '/tab/home';
  static const String mostPopular = '/tab/home/mostPopular';
  static const String homeNotif = '/tab/home/notifScreen';
  static const String mostPopularNotif = '/tab/home/mostPopular/notifScreen';
  static const String search = '/tab/home/searchScreen';

  // Products Tab
  static const String products = '/tab/products';

  // Cart Tab
  static const String cart = '/tab/cart';

  // Profile Tab
  static const String profile = '/tab/profile';
  static const String personalData = '/tab/profile/personalData';
  static const String paymentMethods = '/tab/profile/paymentMethods';
}

class BaseTabNavigator extends StatelessWidget {
  const BaseTabNavigator({
    super.key,
    required this.navigatorKey,
    required this.initialRoute,
  });

  final GlobalKey<NavigatorState> navigatorKey;
  final String initialRoute;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      initialRoute: initialRoute,
      onGenerateRoute: (RouteSettings settings) {
        WidgetBuilder builder;

        switch (settings.name) {
          case BaseTabRoutes.home:
            builder = (_) => const Scaffold(body: HomeScreenBody());
            break;

          case BaseTabRoutes.mostPopular:
            builder =
                (_) => const Scaffold(body: MostPopularProductScreenBody());
            break;

          case BaseTabRoutes.mostPopularNotif:
          case BaseTabRoutes.homeNotif:
            builder = (_) => const Scaffold(body: NotifScreenBody());
            break;

          case BaseTabRoutes.search:
            builder = (_) => const Scaffold(body: SearchScreenBody());
            break;

          case BaseTabRoutes.products:
            builder = (_) => const Scaffold(body: ProductsScreenBody());
            break;

          case BaseTabRoutes.cart:
            builder = (_) => const Scaffold(body: CardScreenBody());
            break;

          case BaseTabRoutes.profile:
            builder = (_) => const Scaffold(body: UserProfileScreenBody());
            break;

          case BaseTabRoutes.personalData:
            builder = (_) => const Scaffold(body: PersonalDataScreenBody());
            break;

          case BaseTabRoutes.paymentMethods:
            builder = (_) => const Scaffold(body: PaymentMethodsScreenBody());
            break;

          default:
            builder = (_) => const Scaffold(
                  body: Center(child: Text('Unknown Route Inside Tab')),
                );
        }

        return MaterialPageRoute(
          builder: builder,
          settings: settings,
        );
      },
    );
  }
}

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
