import 'package:e_palika/config/themes/colors.dart';
import 'package:e_palika/features/auth/presentation/controllers/check_login_controller.dart';
import 'package:e_palika/features/auth/presentation/controllers/user_pref_controller.dart';
import 'package:e_palika/features/homepage/presentation/pages/landing_page/landing_screen.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({super.key});

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  final CheckLoginController checkLoginController =
      Get.put(CheckLoginController());

  UserPreferenceController userPreference = UserPreferenceController();
  @override
  void initState() {
    super.initState();
    isLogin();
    _navigateToHome();
  }

  void isLogin() async {
    userPreference.getUser().then(
      (value) {
        print(value.accessToken.toString());
        if (value.accessToken.toString() == 'null') {
          checkLoginController.checkLogin.value = false;
        } else {
          checkLoginController.checkLogin.value = true;
        }
        print('asd ${checkLoginController.checkLogin.value}');
      },
    );
  }

  _navigateToHome() async {
    await Future.delayed(Duration(milliseconds: 1500), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LandingPageView()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Container(
        width: Get.width,
        height: Get.height,
        decoration: BoxDecoration(
          // border: Border.all(
          //   color: Colors.transparent,
          //   width: Get.width * 0.01,
          // ),
          gradient: const LinearGradient(
            begin: Alignment(0.5, 0),
            end: Alignment(0.5, 1),
            colors: [
              CustomColors.primaryColor1,
              CustomColors.primaryColor,
            ],
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Spacer(
              flex: (Get.height * 0.05).round(),
            ),
            Image.asset(
              'assets/images/logo1.png',
              height: Get.height * 0.27,
              // width: Get.width * 0.5,
            ),
            Spacer(
              flex: (Get.height * 0.06).round(),
            ),
            _buildEmpowerConnectSection(),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildEmpowerConnectSection() {
    return Container(
      width: Get.width,
      padding: EdgeInsets.symmetric(
        horizontal: Get.height * 0.135,
        vertical: Get.width * 0.15,
      ),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/images/img_group_1.png',
          ),
          fit: BoxFit.fitWidth,
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: Get.height * 0.2),
          Text(
            "Empower, Connect, Thrive",
            style: TextStyle(
              color: Colors.white,
              fontSize: 11,
              // fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
