import 'package:e_palika/config/themes/colors.dart';
import 'package:e_palika/presentation/controllers/language_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class EndDrawerWidget extends StatelessWidget {
  final LanguageController languageController = Get.put(LanguageController());
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: CustomColors.appWhite,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: 200,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: CustomColors.primaryColor1,
              ),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/favicon.png',
                      height: 100,
                    ),
                    SizedBox(height: 10),
                    Image.asset(
                      'assets/images/rainadevi.png',
                      height: 35,
                    ),
                  ],
                ),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('home'.tr),
            onTap: () {
              // Handle home item tap
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('setting'.tr),
            onTap: () {
              // Handle settings item tap
            },
          ),
          ListTile(
            leading: Icon(Icons.notifications_none),
            title: Text('notification'.tr),
            onTap: () {
              // Handle profile item tap
            },
          ),
          ListTile(
            leading: Icon(Icons.mail),
            title: Text('notice'.tr),
            onTap: () {
              // Handle messages item tap
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('logout'.tr),
            onTap: () {
              // Handle logout item tap
            },
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 60),
            height: 50,
            child: Row(
              children: [
                Flexible(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      languageController.currentLocale("en_US");
                      languageController.setLanguage();
                    },
                    child: Container(
                      color: languageController.currentLocale.value == 'en_US'
                          ? CustomColors.primaryColor
                          : Colors.white,
                      child: Center(child: Text('english'.tr)),
                    ),
                  ),
                ),
                VerticalDivider(width: 3),
                Flexible(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      languageController.currentLocale("np_NP");
                      languageController.setLanguage();
                    },
                    child: Container(
                      color: languageController.currentLocale.value == 'np_NP'
                          ? CustomColors.primaryColor
                          : Colors.white,
                      child: Center(child: Text('nepali'.tr)),
                    ),
                  ),
                )
              ],
            ),
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Text('English'),
          //     Obx(() => Switch(
          //           value: languageController.currentLocale.value == 'np_NP',
          //           onChanged: (value) {
          //             // languageController.toggleLanguage();
          //           },
          //         )),
          //     Text('Nepali'),
          //   ],
          // ),
          SizedBox(height: 120),
          Container(
            height: 80,
            color: CustomColors.primaryColor,
            alignment: Alignment.bottomRight,
            child: Text("Version 1.0.0"),
          ),
        ],
      ),
    );
  }
}
