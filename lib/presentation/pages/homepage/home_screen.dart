// import 'package:e_palika/config/routes/routes.dart';
import 'package:e_palika/config/themes/colors.dart';
import 'package:e_palika/presentation/controllers/user_pref_controller.dart';
import 'package:e_palika/presentation/pages/homepage/homescreen_widgets/drawer.dart';
import 'package:e_palika/presentation/pages/homepage/homescreen_widgets/feature_buttons.dart';
import 'package:e_palika/presentation/pages/homepage/homescreen_widgets/zone_title_row.dart';
import 'package:e_palika/presentation/widgets/custom_button.dart';
import 'package:flutter/gestures.dart';
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
        backgroundColor: CustomColors.primaryColor,
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //top image container
              Container(
                height: Get.height * 0.17,
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
                    end: Alignment.center,
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
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: Get.height * 0.01),

                          ZoneTitleRow(zoneTitle: 'CITIZEN'),
                          SizedBox(height: Get.height * 0.005),

                          CitizenZoneButtons(),
                          SizedBox(height: Get.height * 0.01),
                          ZoneTitleRow(zoneTitle: 'DIGITAL'),
                          SizedBox(height: Get.height * 0.01),
                          DigitalZoneButtons(),
                          SizedBox(height: Get.height * 0.01),
                          ZoneTitleRow(zoneTitle: 'DIRECT'),
                          SizedBox(height: Get.height * 0.01),
                          DirectZoneButtons(),
                          // buildButtonRow(
                          //   ['Button 1', 'Button 2', 'button4'],
                          //   Get.height * 0.10,
                          //   Get.height * 0.10,
                          //   Get.width * 0.4,
                          //   8.0,
                          // ),
                          SizedBox(height: Get.height * 0.01),
                          ZoneTitleRow(zoneTitle: 'Emergency'),
                          // buildButtonRow(
                          //   ['Button 1', 'Button 2', 'button4'],
                          //   Get.height * 0.10,
                          //   Get.height * 0.10,
                          //   Get.width * 0.4,
                          //   8.0,
                          // ),
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

  SingleChildScrollView DirectZoneButtons() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          FeatureButton(
            child: Text('Education', style: TextStyle(fontSize: 13)),
            btnHeight: Get.height * 0.08,
            btnWidth: Get.width * 0.42,
          ),
          SizedBox(width: Get.width * 0.04),
          FeatureButton(
            child: Text('Education', style: TextStyle(fontSize: 13)),
            btnHeight: Get.height * 0.08,
            btnWidth: Get.width * 0.42,
          ),
          SizedBox(width: Get.width * 0.025),
          FeatureButton(
            child: Text('Eduction', style: TextStyle(fontSize: 13)),
            btnHeight: Get.height * 0.08,
            btnWidth: Get.width * 0.42,
          ),
        ],
      ),
    );
  }

  SingleChildScrollView DigitalZoneButtons() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          FeatureButton(
            child: Text('Education', style: TextStyle(fontSize: 13)),
            btnHeight: Get.height * 0.1,
            btnWidth: Get.width * 0.20,
          ),
          SizedBox(width: Get.width * 0.025),
          FeatureButton(
            child: Text('Education', style: TextStyle(fontSize: 13)),
            btnHeight: Get.height * 0.1,
            btnWidth: Get.width * 0.20,
          ),
          SizedBox(width: Get.width * 0.025),
          FeatureButton(
            child: Text('Eduction', style: TextStyle(fontSize: 13)),
            btnHeight: Get.height * 0.1,
            btnWidth: Get.width * 0.20,
          ),
          SizedBox(width: Get.width * 0.025),
          FeatureButton(
            child: Text('Education', style: TextStyle(fontSize: 12)),
            btnHeight: Get.height * 0.1,
            btnWidth: Get.width * 0.20,
          ),
          SizedBox(width: Get.width * 0.025),
          FeatureButton(
            child: Text('Education', style: TextStyle(fontSize: 12)),
            btnHeight: Get.height * 0.1,
            btnWidth: Get.width * 0.20,
          ),
        ],
      ),
    );
  }

  SingleChildScrollView CitizenZoneButtons() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //first row inside Ctizen Zone
          Row(
            children: [
              FeatureButton(
                child: Text('Departments'),
                btnHeight: Get.height * 0.13,
                btnWidth: Get.width * 0.27,
              ),
              SizedBox(width: Get.width * 0.03),
              FeatureButton(
                child: Text('Departments'),
                btnHeight: Get.height * 0.13,
                btnWidth: Get.width * 0.27,
              ),
              SizedBox(width: Get.width * 0.03),
              FeatureButton(
                child: Text('Departments'),
                btnHeight: Get.height * 0.13,
                btnWidth: Get.width * 0.27,
              ),
              SizedBox(width: Get.width * 0.03),
              FeatureButton(
                child: Text('Departments'),
                btnHeight: Get.height * 0.13,
                btnWidth: Get.width * 0.27,
              ),
              SizedBox(width: Get.width * 0.03),
              FeatureButton(
                child: Text('Departments'),
                btnHeight: Get.height * 0.13,
                btnWidth: Get.width * 0.27,
              ),
            ],
          ),
          SizedBox(height: Get.height * 0.01),

          //second row inside Ctizen Zone
          Row(
            children: [
              FeatureButton(
                child: Text('Departments'),
                btnHeight: Get.height * 0.13,
                btnWidth: Get.width * 0.27,
              ),
              SizedBox(width: Get.width * 0.03),
              FeatureButton(
                child: Text('Departments'),
                btnHeight: Get.height * 0.13,
                btnWidth: Get.width * 0.27,
              ),
              SizedBox(width: Get.width * 0.03),
              FeatureButton(
                child: Text('Departments'),
                btnHeight: Get.height * 0.13,
                btnWidth: Get.width * 0.27,
              ),
              SizedBox(width: Get.width * 0.03),
              FeatureButton(
                child: Text('Departments'),
                btnHeight: Get.height * 0.13,
                btnWidth: Get.width * 0.27,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
