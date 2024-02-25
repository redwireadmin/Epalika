import 'package:e_palika/config/routes/routes.dart';
import 'package:e_palika/config/themes/colors.dart';
import 'package:e_palika/core/utils/widgets/dialogbox_content.dart';
import 'package:e_palika/features/auth/presentation/controllers/check_login_controller.dart';
import 'package:e_palika/features/auth/presentation/controllers/user_pref_controller.dart';
import 'package:e_palika/features/homepage/presentation/controllers/language_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class EndDrawerWidget extends StatelessWidget {
  final LanguageController languageController = Get.put(LanguageController());
  UserPreferenceController userPreference = UserPreferenceController();
  final CheckLoginController drawerController =
      Get.find<CheckLoginController>();

  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: CustomColors.appWhite,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: Get.height * 0.25,
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
                      height: Get.height * 0.15,
                    ),
                    SizedBox(height: 10),
                    Image.asset(
                      'assets/images/rainadevi.png',
                      height: Get.height * 0.04,
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

          Obx(() => drawerController.checkLogin.value
              ? ListTile(
                  leading: Icon(Icons.exit_to_app),
                  title: Text('logout'.tr),
                  onTap: () {
                    drawerController.checkLogin.value = false;
                    userPreference.removeUser().then((value) {
                      Get.defaultDialog(
                        title: '',
                        content: DialogBoxContent(
                          btnText: 'Okay',
                          middleText: "Logged out Successfully",
                          centerIcon: Icon(Icons.check),
                          onPressed: () {
                            Get.back();
                          },
                        ),
                        barrierDismissible: true,
                      );
                      Get.toNamed(Routes.land);
                    });
                  },
                )
              : ListTile(
                  leading: Icon(Icons.person),
                  title: Text('login'.tr),
                  onTap: () {
                    Get.toNamed(Routes.login);
                  },
                )),
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
          SizedBox(height: Get.height * 0.185),
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
