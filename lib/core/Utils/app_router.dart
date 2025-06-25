import 'package:advanced_ecommerce/features/Splash/presentation/views/splash_view.dart';
import 'package:get/get.dart';

abstract class AppRouter {
  static String splashScreen = "/";

  static List<GetPage<dynamic>>? getViews() {
    return [
      GetPage(
        name: splashScreen,
        page: () => const SplashView(),
      ),
    ];
  }
}
