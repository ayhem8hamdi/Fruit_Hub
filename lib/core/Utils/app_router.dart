import 'package:advanced_ecommerce/features/OnBoarding/presentation/views/on_boarding_view.dart';
import 'package:advanced_ecommerce/features/Splash/presentation/views/splash_view.dart';
import 'package:advanced_ecommerce/features/auth/presentation/views/create_new_password_screen.dart';
import 'package:advanced_ecommerce/features/auth/presentation/views/login_screen.dart';
import 'package:advanced_ecommerce/features/auth/presentation/views/password_forgot_screen.dart';
import 'package:advanced_ecommerce/features/auth/presentation/views/recover_password_screen.dart';
import 'package:advanced_ecommerce/features/auth/presentation/views/sign_up_screen.dart';
import 'package:advanced_ecommerce/features/home/presentation/view/home_screen.dart';
import 'package:advanced_ecommerce/features/home/presentation/view/most_popular_product_screen.dart';
import 'package:advanced_ecommerce/features/notifications/presentation/views/notif_screen.dart';
import 'package:advanced_ecommerce/features/user_profile/presentation/views/user_profile_screen.dart';
import 'package:get/get.dart';

abstract class AppRouter {
  static String splashScreen = "/";
  static String onBoardingScreen = "/onBoardingScreen";
  static String homeScreen = "/homeScreen";
  static String mostPopularScreen = "/homeScreen/mostPopularScreen";
  static String notifScreen = "/homeScreen/notifScreen";
  static String userProfileScreen = "/homeScreen/userProfileScreen";
  static String loginScreen = "/loginScreen";
  static String signUpScreen = "/loginScreen/signUpScreen";
  static String passwordForgotScreen = "/loginScreen/passwordForgot";
  static String recoverPasswordScreen =
      "/loginScreen/passwordForgot/recoverPasswordScreen";
  static String createNewPasswordScreen =
      "/loginScreen/passwordForgot/recoverPasswordScreen/createNewPasswordScreen";
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
      GetPage(
        name: homeScreen,
        page: () => const HomeScreen(),
      ),
      GetPage(
        name: loginScreen,
        page: () => const LoginScreen(),
      ),
      GetPage(
        name: signUpScreen,
        page: () => const SignUpScreen(),
      ),
      GetPage(
        name: passwordForgotScreen,
        page: () => const PasswordForgotScreen(),
      ),
      GetPage(
        name: recoverPasswordScreen,
        page: () => const RecoverPasswordScreen(),
      ),
      GetPage(
        name: createNewPasswordScreen,
        page: () => const CreateNewPasswordScreen(),
      ),
      GetPage(
        name: mostPopularScreen,
        page: () => const MostPopularProductScreen(),
      ),
      GetPage(
        name: notifScreen,
        page: () => const NotifScreen(),
      ),
      GetPage(
        name: userProfileScreen,
        page: () => const UserProfileScreen(),
      )
    ];
  }
}
