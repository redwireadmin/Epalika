import 'package:e_palika/config/themes/colors.dart';
import 'package:e_palika/presentation/pages/homepage/home_screen.dart';
import 'package:e_palika/presentation/pages/landing_page/icons.dart';
import 'package:e_palika/presentation/pages/notice/notice_page.dart';
import 'package:e_palika/presentation/pages/notification/notification_page.dart';
import 'package:e_palika/presentation/pages/profile_page/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LandingPageView extends StatefulWidget {
  const LandingPageView({super.key});

  @override
  State<LandingPageView> createState() => _LandingPageViewState();
}

class _LandingPageViewState extends State<LandingPageView> {
  int currentIndex = 0;
  List<Widget> pages = [
    HomePageView(),
    NoticePageView(),
    HomePageView(),
    NotificationPageView(),
    ProfilePageWithoutLogin()
  ];
  void changePage(index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: CustomColors.primaryColor,
      body: pages[currentIndex],
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
                isSelected: 0 == currentIndex,
              ),
              onPressed: () {
                changePage(0);
              },
            ),
            IconButton(
              icon: GradientIcon(
                assetName: "notice",
                isSelected: 1 == currentIndex,
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
                isSelected: 3 == currentIndex,
              ),
              onPressed: () {
                changePage(3);
              },
            ),
            IconButton(
              icon: GradientIcon(
                assetName: "profile",
                isSelected: 4 == currentIndex,
              ),
              onPressed: () {
                changePage(4);
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
