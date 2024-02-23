import 'package:e_palika/config/themes/colors.dart';
import 'package:e_palika/features/auth/presentation/controllers/check_login_controller.dart';
import 'package:e_palika/features/auth/presentation/controllers/user_pref_controller.dart';
import 'package:e_palika/features/homepage/presentation/pages/home_page/home_screen.dart';
import 'package:e_palika/features/homepage/presentation/pages/landing_page/icons.dart';
import 'package:e_palika/features/homepage/presentation/pages/landing_page/landing_page_controller/landing_page_controller.dart';
import 'package:e_palika/features/homepage/presentation/pages/notice_page/notice_page.dart';
import 'package:e_palika/features/homepage/presentation/pages/notification_page/notification_page.dart';
import 'package:e_palika/features/homepage/presentation/pages/profile_page/profile_page_with_login.dart';
import 'package:e_palika/features/homepage/presentation/pages/profile_page/profile_page_without_login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LandingPageView extends StatefulWidget {
  const LandingPageView({super.key});

  @override
  State<LandingPageView> createState() => _LandingPageViewState();
}

class _LandingPageViewState extends State<LandingPageView> {
  final LandingPageController landingPageController =
      Get.put(LandingPageController());
  final CheckLoginController checkLoginController =
      Get.put(CheckLoginController());
  UserPreferenceController userPreference = UserPreferenceController();

  List<Widget> pages = [
    HomePageView(),
    NoticePageView(),
    HomePageView(),
    NotificationPageView(),
    ProfilePageWithoutLogin(),
    ProfilePageWithLogin(),
  ];
  void changePage(index) {
    setState(() {
      landingPageController.currentIndex(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: CustomColors.primaryColor,
      body: pages[landingPageController.currentIndex.value],
      bottomNavigationBar: BottomAppBar(
        padding: EdgeInsets.symmetric(vertical: 3, horizontal: 25),
        height: Get.height * 0.07,
        elevation: 8,
        // color: CustomColors.primaryColor1.withOpacity(0.5),
        shape: CircularNotchedRectangle(),
        notchMargin: 7,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: GradientIcon(
                assetName: "home",
                isSelected: 0 == landingPageController.currentIndex.value,
              ),
              onPressed: () {
                changePage(0);
              },
            ),
            IconButton(
              icon: GradientIcon(
                assetName: "notice",
                isSelected: 1 == landingPageController.currentIndex.value,
              ),
              onPressed: () {
                changePage(1);
              },
            ),
            IconButton(
              icon: SizedBox.shrink(),
              onPressed: () {
                changePage(2);
              },
            ),
            IconButton(
              icon: GradientIcon(
                assetName: "notification-bell",
                isSelected: 3 == landingPageController.currentIndex.value,
              ),
              onPressed: () {
                changePage(3);
              },
            ),
            IconButton(
              icon: GradientIcon(
                assetName: "profile",
                isSelected: 4 == landingPageController.currentIndex.value,
              ),
              onPressed: () {
                if (checkLoginController.checkLogin.value) {
                  changePage(5);
                } else {
                  changePage(4);
                }
              },
            ),
          ],
        ),
      ),
      floatingActionButton: CircleAvatar(
        radius: 30,
        backgroundColor: CustomColors.primaryColor1.withOpacity(0.85),
        // backgroundImage: AssetImage('assets/images/favicon.png'),
        child: Image.asset(
          'assets/images/favicon.png',
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    ));
  }
}
