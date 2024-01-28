import 'package:e_palika/config/themes/colors.dart';
import 'package:e_palika/presentation/pages/homepage/home_screen.dart';
import 'package:e_palika/presentation/pages/homepage/homescreen_widgets/icons.dart';
import 'package:e_palika/presentation/pages/login_screen.dart';
import 'package:e_palika/presentation/pages/notice/notice_page.dart';
import 'package:e_palika/presentation/pages/notification/notification_page.dart';
import 'package:flutter/material.dart';

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
    LoginView()
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      extendBody: true,
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 4.0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: CustomColors.appWhite,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        selectedItemColor: CustomColors.primaryColor,
        items: [
          BottomNavigationBarItem(
            icon: GradientIcon(
              assetName: "home",
              isSelected: 0 == currentIndex,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: GradientIcon(
              assetName: "notice",
              isSelected: 1 == currentIndex,
            ),
            label: "Notice",
          ),
          BottomNavigationBarItem(
            icon: SizedBox.shrink(),
            label: "Notification",
          ),
          BottomNavigationBarItem(
            icon: GradientIcon(
              assetName: "notification-bell",
              isSelected: 3 == currentIndex,
            ),
            label: "Notification",
          ),
          BottomNavigationBarItem(
            icon: GradientIcon(
              assetName: "profile",
              isSelected: 4 == currentIndex,
            ),
            label: "Profile",
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: CircleAvatar(
          radius: 27,
          backgroundColor: CustomColors.primaryColor1,
          backgroundImage: AssetImage('assets/images/favicon.png'),
          child: Image.asset(
            'assets/images/favicon.png',
            fit: BoxFit.fitHeight,
          ),
        ),
        shape: CircleBorder(),
        backgroundColor: CustomColors.primaryColor1,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    ));
  }
}
