import 'package:e_palika/config/themes/colors.dart';
import 'package:e_palika/features/auth/presentation/controllers/user_pref_controller.dart';
import 'package:e_palika/features/homepage/presentation/pages/home_page/homescreen_widgets/build_button_row.dart';
import 'package:e_palika/features/homepage/presentation/pages/home_page/homescreen_widgets/carousal_slider.dart';
import 'package:e_palika/features/homepage/presentation/pages/home_page/homescreen_widgets/drawer.dart';
import 'package:e_palika/features/homepage/presentation/pages/home_page/homescreen_widgets/news_marquee.dart';
import 'package:e_palika/features/homepage/presentation/pages/home_page/homescreen_widgets/zone_title_row.dart';
import 'package:e_palika/core/utils/widgets/custom_button.dart';
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
          toolbarHeight: Get.height * 0.067,
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
              topImageContainer(),
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
                    newsRowContent(),
                    //different Zones with buttons
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: Get.height * 0.01),
                          ZoneTitleRow(zoneTitle: 'CITIZEN'),
                          SizedBox(height: Get.height * 0.005),
                          CitizenZoneButtons(),
                          ZoneTitleRow(zoneTitle: 'DIGITAL'),
                          SizedBox(height: Get.height * 0.005),
                          DigitalZoneButtons(),
                          ZoneTitleRow(zoneTitle: 'DIRECT'),
                          SizedBox(height: Get.height * 0.005),
                          DirectZoneButtons(),
                          SizedBox(height: Get.height * 0.02),
                          ZoneTitleRow(zoneTitle: 'Emergency'),
                          SizedBox(height: Get.height * 0.005),
                          EmergencyZoneButtons(),
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

  Container topImageContainer() {
    return Container(
      height: Get.height * 0.2,
      width: Get.width,
      child: CarouselSlider1(),
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
    );
  }

  Container newsRowContent() {
    return Container(
      height: Get.height * 0.04,
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
            child: Text(
              "News",
              style: TextStyle(fontSize: 10),
            ),
            width: 70,
            onPressed: () {},
            radius: 5,
          ),
          Flexible(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: CustomColors.appWhite,
              ),
              child: NewsMarquee(),
            ),
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
          buildButtonRow(
              buttonContent: [
                Column(
                  children: [
                    Icon(
                      Icons.computer,
                      size: Get.height * 0.04,
                    ),
                    Text('Departments', style: TextStyle(fontSize: 13)),
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      Icons.assistant,
                      size: Get.height * 0.04,
                    ),
                    Text('Services', style: TextStyle(fontSize: 13)),
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      Icons.rule_sharp,
                      size: Get.height * 0.04,
                    ),
                    Text('Act laws', style: TextStyle(fontSize: 13)),
                  ],
                ),
                Text('Citizen1', style: TextStyle(fontSize: 13)),
                Text('Citizen1', style: TextStyle(fontSize: 13)),
              ],
              onPressRoutes: [
                '/departments',
                '/services',
                '/actlaw',
                'Citizen1',
                'Citizen1'
              ],
              height: Get.height * 0.13,
              width: Get.width * 0.27,
              gap: Get.width * 0.03),
          SizedBox(height: Get.height * 0.01),
          //second row inside Ctizen Zone
          buildButtonRow(
              buttonContent: [
                Column(
                  children: [
                    Icon(
                      Icons.add_chart_rounded,
                      size: Get.height * 0.04,
                    ),
                    Text('Citizen\nCharter', style: TextStyle(fontSize: 13)),
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      Icons.bookmark_add_rounded,
                      size: Get.height * 0.04,
                    ),
                    Text('Notice\nBoard', style: TextStyle(fontSize: 13)),
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      Icons.home_filled,
                      size: Get.height * 0.04,
                    ),
                    Text('Ward', style: TextStyle(fontSize: 13)),
                  ],
                ),
                Text('Citizen2', style: TextStyle(fontSize: 13)),
                Text('Citizen2', style: TextStyle(fontSize: 13)),
              ],
              onPressRoutes: [
                'Citizen2',
                'Citizen2',
                'Citizen2',
                'Citizen2',
                'Citizen2'
              ],
              height: Get.height * 0.13,
              width: Get.width * 0.27,
              gap: Get.width * 0.03),
          SizedBox(height: Get.height * 0.01),
        ],
      ),
    );
  }

  SingleChildScrollView DigitalZoneButtons() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        children: [
          buildButtonRow(
            buttonContent: [
              Column(
                children: [
                  Icon(Icons.book),
                  Text(
                    'Digital\nApproval',
                    style: TextStyle(fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              Column(
                children: [
                  Icon(Icons.grade),
                  Text(
                    'Digital\nEducation',
                    style: TextStyle(fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              Column(
                children: [
                  Icon(Icons.person),
                  Text(
                    'Digital\nProfile',
                    style: TextStyle(fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              Column(
                children: [
                  Icon(Icons.travel_explore),
                  Text(
                    'Digital\nTourism',
                    style: TextStyle(fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              Column(
                children: [
                  Icon(Icons.book),
                  Text(
                    'Digital\nEducation',
                    style: TextStyle(fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ],
            onPressRoutes: [
              'Digital1',
              'Digital2',
              'Digital3',
              'Digital4',
              'Digital5'
            ],
            height: Get.height * 0.1,
            width: Get.width * 0.20,
            gap: Get.width * 0.025,
          ),
          SizedBox(height: Get.height * 0.01),
        ],
      ),
    );
  }

  SingleChildScrollView DirectZoneButtons() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        children: [
          buildButtonRow(
              buttonContent: [
                Row(
                  children: [
                    Icon(
                      Icons.person,
                      size: Get.width * 0.1,
                    ),
                    SizedBox(width: Get.width * 0.04),
                    Text(
                      'Presidential\nHotline',
                      style: TextStyle(fontSize: 13),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.post_add,
                      size: Get.width * 0.1,
                    ),
                    SizedBox(width: Get.width * 0.04),
                    Text(
                      'Complaint\nBox',
                      style: TextStyle(fontSize: 13),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                Text('Direct2', style: TextStyle(fontSize: 13)),
                Text('Direct3', style: TextStyle(fontSize: 13)),
              ],
              onPressRoutes: [
                'presedentailhotline',
                'Direct2',
                'Direct3'
              ],
              height: Get.height * 0.08,
              width: Get.width * 0.42,
              gap: Get.width * 0.03),
          SizedBox(height: Get.height * 0.01),
        ],
      ),
    );
  }

  SingleChildScrollView EmergencyZoneButtons() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        children: [
          buildButtonRow(
            buttonContent: [
              Column(
                children: [
                  Icon(Icons.person),
                  Text(
                    'Police',
                    style: TextStyle(fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              Column(
                children: [
                  Icon(Icons.car_crash),
                  Text(
                    'Ambulance',
                    style: TextStyle(fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              Column(
                children: [
                  Icon(Icons.fire_truck),
                  Text(
                    'Fire Fighter',
                    style: TextStyle(fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ],
            onPressRoutes: ['Emergency1', 'Emergency2', 'Emergency3'],
            height: Get.height * 0.1,
            width: Get.width * 0.20,
            gap: Get.width * 0.025,
          ),
          SizedBox(height: Get.height * 0.01),
        ],
      ),
    );
  }
}
