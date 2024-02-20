import 'package:e_palika/features/auth/presentation/pages/forgot_password/forgot_pw_screen.dart';
import 'package:e_palika/features/auth/presentation/pages/forgot_password/new_password_screen.dart';
import 'package:e_palika/features/auth/presentation/pages/otp_verification_screen.dart';
import 'package:e_palika/features/homepage/presentation/pages/actlaw_page/actlaw_screen.dart';
import 'package:e_palika/features/homepage/presentation/pages/department_page/department_screen.dart';
import 'package:e_palika/features/homepage/presentation/pages/home_page/home_screen.dart';
import 'package:e_palika/features/auth/presentation/pages/login_screen.dart';
import 'package:e_palika/features/auth/presentation/pages/signup_screen.dart';
import 'package:e_palika/features/auth/presentation/pages/splash_screen.dart';
import 'package:e_palika/features/homepage/presentation/pages/service_page/service_screen.dart';
import 'package:get/get.dart';

class Routes {
  //auth routes
  static String splash = '/';
  static String home = '/home';
  static String login = '/login';
  static String signup = '/signup';
  static String forgotpassword = '/forgotpw';
  static String verifyotp = '/verifyotp';
  static String newpassword = '/newpassword';

  //homepage routes
  static String departments = '/departments';
  static String services = '/services';
  static String actlaw = '/actlaw';
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
  GetPage(
    name: Routes.departments,
    page: () => DepartmentPage(),
  ),
  GetPage(
    name: Routes.services,
    page: () => ServicePage(),
  ),
  GetPage(
    name: Routes.actlaw,
    page: () => ActLawPage(),
  ),
];
