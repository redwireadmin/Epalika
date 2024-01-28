// import 'package:e_palika/config/routes/routes.dart';
import 'package:e_palika/config/themes/colors.dart';
import 'package:e_palika/presentation/controllers/user_pref_controller.dart';
import 'package:e_palika/presentation/pages/homepage/homescreen_widgets/drawer.dart';
import 'package:e_palika/presentation/pages/homepage/homescreen_widgets/zone_title_row.dart';
import 'package:e_palika/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  UserPreferenceController userPreference = UserPreferenceController();
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColors.appWhite,
        key: _scaffoldKey,
        appBar: AppBar(
          elevation: 4.0,
          backgroundColor: CustomColors.primaryColor1,
          leading: Padding(
            padding: const EdgeInsets.only(top: 4, bottom: 4, left: 8),
            child: Image.asset('assets/images/favicon.png'),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                // Open the end drawer when the IconButton is pressed
                _scaffoldKey.currentState?.openEndDrawer();
              },
            ),
            // IconButton(
            //   onPressed: () {
            //     userPreference.removeUser().then((value) {
            //       Get.offAllNamed(Routes.login);
            //     });
            //   },
            //   icon: Icon(
            //     Icons.logout,
            //     color: Colors.black,
            //   ),
            // )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              //top image container
              Container(
                height: Get.height * 0.25,
                width: Get.width,
                child: Image.asset(
                  'assets/images/homepage_topImage.jpg',
                  fit: BoxFit.fitWidth,
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5), // shadow color
                      spreadRadius: 5, // spread radius
                      blurRadius: 7, // blur radius
                      offset: Offset(0, 3), // changes the shadow position
                    ),
                  ],
                ),
              ),

              //Bottom Container

              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      CustomColors.primaryColor1,
                      CustomColors.primaryColor,
                    ],
                    // Add more colors if needed
                  ),
                ),
                child: Column(
                  children: [
                    //news button container
                    Container(
                      height: Get.height * 0.05,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5), // shadow color
                            spreadRadius: 5, // spread radius
                            blurRadius: 7, // blur radius
                            offset: Offset(0, 3), // changes the shadow position
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          CustomElevatedButton(
                            child: Text("News"),
                            width: 10,
                            onPressed: () {},
                            radius: 5,
                          ),
                          Flexible(
                            flex: 1,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //different Zones with buttons
                    Container(
                      padding: EdgeInsets.only(
                          top: 10, left: 20, right: 20, bottom: 10),
                      child: Column(
                        children: [
                          ZoneTitleRow(zoneTitle: 'CITIZEN'),
                          buildButtonRow(
                            ['Button 1', 'Button 2', 'Button 3', 'button4'],
                            Get.height * 0.15,
                            Get.height * 0.15,
                            Get.width * 0.15,
                            8.0,
                          ),

                          // Second row of buttons
                          buildButtonRow(
                            ['Button 4', 'Button 5', 'Button 6', 'button4'],
                            Get.height * 0.15,
                            Get.height * 0.15,
                            Get.width * 0.15,
                            8.0,
                          ),
                          SizedBox(height: Get.height * 0.02),
                          ZoneTitleRow(zoneTitle: 'DIGITAL'),
                          buildButtonRow(
                            ['Btn1', 'btn2', 'btn3', 'btn4'],
                            Get.height * 0.11,
                            Get.height * 0.11,
                            Get.width * 0.11,
                            5.0,
                          ),
                          SizedBox(height: Get.height * 0.02),
                          ZoneTitleRow(zoneTitle: 'DIRECT'),
                          buildButtonRow(
                            ['Button 1', 'Button 2', 'button4'],
                            Get.height * 0.10,
                            Get.height * 0.10,
                            Get.width * 0.4,
                            8.0,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        endDrawer: EndDrawerWidget(),
      ),
    );
  }

  Widget buildButtonRow(List<String> buttonLabels, double rowHeight,
      double btnHeight, double btnWidth, double buttonGap) {
    return Container(
      height: rowHeight,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: buttonLabels.map((label) {
          return Padding(
              padding: EdgeInsets.all(buttonGap),
              child: CustomElevatedButton(
                child: Text(label),
                onPressed: () {},
                height: btnHeight,
                width: btnWidth,
                radius: 20,
                backGroundColor: CustomColors.appWhite,
                foreGroundColor: CustomColors.primaryColor1,
                side: BorderSide(
                  color: CustomColors.primaryColor1,
                  width: 3.0,
                ),
              ));
        }).toList(),
      ),
    );
  }
}
