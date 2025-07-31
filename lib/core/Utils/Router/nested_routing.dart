import 'package:advanced_ecommerce/features/card_and_products_details/presentation/views/widgets/card_screen_body.dart';
import 'package:advanced_ecommerce/features/home/presentation/view/widgets/home_screen_body.dart';
import 'package:advanced_ecommerce/features/home/presentation/view/widgets/most_popular_product_screen_body.dart';
import 'package:advanced_ecommerce/features/home/presentation/view/widgets/products_screen_body.dart';
import 'package:advanced_ecommerce/features/notifications/presentation/views/widgets/notif_screen_body.dart';
import 'package:advanced_ecommerce/features/search/presentaion/views/widgets/search_screen_body.dart';
import 'package:advanced_ecommerce/features/user_profile/presentation/views/widgets/add_payment_method_screen_body.dart';
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
  static const String addPaymentMethod =
      '/tab/profile/paymentMethods/addPaymentMethod';
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

          case BaseTabRoutes.addPaymentMethod:
            builder = (_) => const Scaffold(body: AddPaymentMethodScreenBody());
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
