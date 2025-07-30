import 'package:advanced_ecommerce/core/Utils/base_screen_with_nav.dart';
import 'package:advanced_ecommerce/features/OnBoarding/presentation/views/on_boarding_view.dart';
import 'package:advanced_ecommerce/features/Splash/presentation/views/splash_view.dart';
import 'package:advanced_ecommerce/features/auth/presentation/views/create_new_password_screen.dart';
import 'package:advanced_ecommerce/features/auth/presentation/views/login_screen.dart';
import 'package:advanced_ecommerce/features/auth/presentation/views/password_forgot_screen.dart';
import 'package:advanced_ecommerce/features/auth/presentation/views/recover_password_screen.dart';
import 'package:advanced_ecommerce/features/auth/presentation/views/sign_up_screen.dart';
import 'package:advanced_ecommerce/features/card_and_products_details/presentation/views/card_screen.dart';
import 'package:advanced_ecommerce/features/home/presentation/view/home_screen.dart';
import 'package:advanced_ecommerce/features/home/presentation/view/products_screen.dart';
import 'package:advanced_ecommerce/features/home/presentation/view/widgets/most_popular_product_screen_body.dart';
import 'package:advanced_ecommerce/features/notifications/presentation/views/notif_screen.dart';
import 'package:advanced_ecommerce/features/user_profile/presentation/views/user_profile_screen.dart';
import 'package:advanced_ecommerce/features/home/presentation/view/widgets/home_screen_body.dart';
import 'package:advanced_ecommerce/features/home/presentation/view/widgets/products_screen_body.dart';
import 'package:advanced_ecommerce/features/card_and_products_details/presentation/views/widgets/card_screen_body.dart';
import 'package:advanced_ecommerce/features/user_profile/presentation/views/widgets/user_profile_screen_body.dart';
import 'package:get/get.dart';

abstract class AppRouter {
  // Existing routes — untouched
  static String splashScreen = "/";
  static String onBoardingScreen = "/onBoardingScreen";
  static String homeScreen = "/homeScreen";
  static String cardScreen = "/cardScreen";
  static String mostPopularScreen = "/tab/home/mostPopular";
  static String notifScreen = "/homeScreen/notifScreen";
  static String userProfileScreen = "/homeScreen/userProfileScreen";
  static String loginScreen = "/loginScreen";
  static String signUpScreen = "/loginScreen/signUpScreen";
  static String passwordForgotScreen = "/loginScreen/passwordForgot";
  static String recoverPasswordScreen =
      "/loginScreen/passwordForgot/recoverPasswordScreen";
  static String productsScreen = "/productsScreenBody";
  static String createNewPasswordScreen =
      "/loginScreen/passwordForgot/recoverPasswordScreen/createNewPasswordScreen";

  // 🔥 New nested navigation wrapper
  static String mainTabs = "/mainTabs";

  // 🔀 Nested tab routes
  static String tabHome = "/tab/home";
  static String tabProducts = "/tab/products";
  static String tabCart = "/tab/cart";
  static String tabProfile = "/tab/profile";

  static List<GetPage<dynamic>>? getViews() {
    return [
      // Existing routes
      GetPage(name: splashScreen, page: () => const SplashView()),
      GetPage(name: onBoardingScreen, page: () => const OnBoardingView()),
      GetPage(name: homeScreen, page: () => const HomeScreen()),
      GetPage(name: loginScreen, page: () => const LoginScreen()),
      GetPage(name: signUpScreen, page: () => const SignUpScreen()),
      GetPage(
          name: passwordForgotScreen, page: () => const PasswordForgotScreen()),
      GetPage(
          name: recoverPasswordScreen,
          page: () => const RecoverPasswordScreen()),
      GetPage(
          name: createNewPasswordScreen,
          page: () => const CreateNewPasswordScreen()),
      GetPage(
          name: mostPopularScreen,
          page: () => const MostPopularProductScreenBody()),
      GetPage(name: notifScreen, page: () => const NotifScreen()),
      GetPage(name: userProfileScreen, page: () => const UserProfileScreen()),
      GetPage(name: productsScreen, page: () => const ProductsScreen()),
      GetPage(name: cardScreen, page: () => const CardScreen()),

      // ✅ NEW: Wrapper that holds the nested navigator
      GetPage(
          name: mainTabs,
          page: () => const BaseScreenWithNav(
                initialIndex: 0,
              )),

      // ✅ NEW: Nested pages for each tab (no bindings here, keep logic external)
      GetPage(name: tabHome, page: () => const HomeScreenBody()),
      GetPage(name: tabProducts, page: () => const ProductsScreenBody()),
      GetPage(name: tabCart, page: () => const CardScreenBody()),
      GetPage(name: tabProfile, page: () => const UserProfileScreenBody()),
    ];
  }
}
