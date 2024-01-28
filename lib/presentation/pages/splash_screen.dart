import 'package:e_palika/config/themes/colors.dart';
import 'package:e_palika/presentation/controllers/user_pref_controller.dart';
import 'package:e_palika/presentation/pages/landing_screen.dart';
import 'package:e_palika/presentation/pages/login_screen.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({super.key});

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  UserPreferenceController userPreference = UserPreferenceController();
  @override
  void initState() {
    super.initState();
    // isLogin();
    _navigateToHome();
  }

  void isLogin() async {
    userPreference.getUser().then((value) {
      if (value.accessToken.toString() == 'null') {
        _navigateToLogin();
      } else {
        _navigateToHome();
      }
    });
  }

  _navigateToHome() async {
    await Future.delayed(Duration(milliseconds: 1500), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LandingPageView()));
    });
  }

  _navigateToLogin() async {
    await Future.delayed(const Duration(milliseconds: 1500), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginView()));
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
          border: Border.all(
            color: Colors.transparent,
            width: Get.width * 0.01,
          ),
          gradient: const LinearGradient(
            begin: Alignment(0.5, 0),
            end: Alignment(0.5, 1),
            colors: [
              CustomColors.primaryColor1,
              CustomColors.primaryColor,
            ],
          ),
        ),
        child: SizedBox(
          width: double.maxFinite,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Spacer(
                flex: 66,
              ),
              Image.asset(
                'assets/images/logo1.png',
                height: Get.height * 0.3,
                // width: Get.width * 0.5,
              ),
              Spacer(
                flex: 33,
              ),
              _buildEmpowerConnectSection(),
            ],
          ),
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
          fit: BoxFit.fitHeight,
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: Get.height * 0.16),
          const Text(
            "Empower, Connect, Thrive",
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              // fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
