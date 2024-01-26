import 'package:e_palika/presentation/pages/forgot_password/forgot_pw_screen.dart';
import 'package:e_palika/presentation/pages/forgot_password/new_password_screen.dart';
import 'package:e_palika/presentation/pages/otp_verification_screen.dart';
import 'package:e_palika/presentation/pages/home_screen.dart';
import 'package:e_palika/presentation/pages/login_screen.dart';
import 'package:e_palika/presentation/pages/signup_screen.dart';
import 'package:e_palika/presentation/pages/splash_screen.dart';
import 'package:get/get.dart';

class Routes {
  static String splash = '/';
  static String home = '/home';
  static String login = '/login';
  static String signup = '/signup';
  static String forgotpassword = '/forgotpw';
  static String verifyotp = '/verifyotp';
  static String newpassword = '/newpassword';
}

final getPages = [
  GetPage(
    name: Routes.splash,
    page: () => const SplashScreenView(),
  ),
  GetPage(
    name: Routes.home,
    page: () => const HomePageView(),
  ),
  GetPage(
    name: Routes.login,
    page: () => LoginView(),
  ),
  GetPage(
    name: Routes.signup,
    page: () => SignupView(),
  ),
  GetPage(
    name: Routes.forgotpassword,
    page: () => ForgotPasswordView(),
  ),
  GetPage(
    name: Routes.verifyotp,
    page: () => OtpVerificationScreen(),
  ),
  GetPage(
    name: Routes.newpassword,
    page: () => CreateNewPasswordView(),
  ),
];
