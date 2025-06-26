import 'package:advanced_ecommerce/features/OnBoarding/presentation/views/on_boarding_view.dart';
import 'package:advanced_ecommerce/features/Splash/presentation/views/splash_view.dart';
import 'package:get/get.dart';

abstract class AppRouter {
  static String splashScreen = "/";
  static String onBoardingScreen = "/onBoardingScreen";
  static List<GetPage<dynamic>>? getViews() {
    return [
      GetPage(
        name: splashScreen,
        page: () => const SplashView(),
      ),
      GetPage(
        name: onBoardingScreen,
        page: () => const OnBoardingView(),
      ),
    ];
  }
}
