// import 'package:e_palika/config/routes/routes.dart';
import 'package:e_palika/config/themes/colors.dart';
import 'package:e_palika/presentation/controllers/user_pref_controller.dart';
import 'package:e_palika/presentation/pages/homepage/homescreen_widgets/drawer.dart';
import 'package:e_palika/presentation/pages/homepage/homescreen_widgets/feature_buttons.dart';
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
                      padding: EdgeInsets.only(
                          top: 10, left: 20, right: 20, bottom: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: Get.height * 0.01),
                          ZoneTitleRow(zoneTitle: 'CITIZEN'),
                          SizedBox(height: Get.height * 0.01),
                          CitizenZoneButtons(),
                          SizedBox(height: Get.height * 0.01),
                          ZoneTitleRow(zoneTitle: 'DIGITAL'),
                          SizedBox(height: Get.height * 0.01),
                          DigitalZoneButtons(),
                          SizedBox(height: Get.height * 0.01),
                          ZoneTitleRow(zoneTitle: 'DIRECT'),
                          SizedBox(height: Get.height * 0.01),
                          DirectZoneButtons(),
                          SizedBox(height: Get.height * 0.01),
                          ZoneTitleRow(zoneTitle: 'Emergency'),
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
    );
  }

  Container newsRowContent() {
    return Container(
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
            [
              Column(
                children: [
                  Icon(
                    Icons.computer,
                    size: Get.height * 0.06,
                  ),
                  Text('Department', style: TextStyle(fontSize: 13)),
                ],
              ),
              Text('Service', style: TextStyle(fontSize: 13)),
              Text('Act law', style: TextStyle(fontSize: 13)),
              Text('Citizen1', style: TextStyle(fontSize: 13)),
              Text('Citizen1', style: TextStyle(fontSize: 13)),
            ],
            ['deparment', 'service', 'actlaw', 'Citizen1', 'Citizen1'],
            Get.height * 0.13,
            Get.width * 0.27,
            Get.width * 0.03,
          ),
          SizedBox(height: Get.height * 0.01),
          //second row inside Ctizen Zone
          buildButtonRow(
            [
              Text('Citizen2', style: TextStyle(fontSize: 13)),
              Text('Citizen2', style: TextStyle(fontSize: 13)),
              Text('Citizen2', style: TextStyle(fontSize: 13)),
              Text('Citizen2', style: TextStyle(fontSize: 13)),
              Text('Citizen2', style: TextStyle(fontSize: 13)),
            ],
            ['Citizen2', 'Citizen2', 'Citizen2', 'Citizen2', 'Citizen2'],
            Get.height * 0.13,
            Get.width * 0.27,
            Get.width * 0.03,
          ),
        ],
      ),
    );
  }

  SingleChildScrollView DigitalZoneButtons() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: buildButtonRow(
        [
          Column(
            children: [
              Icon(Icons.book),
              Text('Digital1', style: TextStyle(fontSize: 13)),
            ],
          ),
          Text('Digital2', style: TextStyle(fontSize: 13)),
          Text('Digital3', style: TextStyle(fontSize: 13)),
          Text('Digital4', style: TextStyle(fontSize: 13)),
          Text('Digital5', style: TextStyle(fontSize: 13)),
        ],
        ['Digital1', 'Digital2', 'Digital3', 'Digital4', 'Digital5'],
        Get.height * 0.1,
        Get.width * 0.20,
        Get.width * 0.025,
      ),
    );
  }

  SingleChildScrollView DirectZoneButtons() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: buildButtonRow(
        [
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
          Text('Direct2', style: TextStyle(fontSize: 13)),
          Text('Direct3', style: TextStyle(fontSize: 13)),
        ],
        ['presedentailhotline', 'Direct2', 'Direct3'],
        Get.height * 0.08,
        Get.width * 0.42,
        Get.width * 0.03,
      ),
    );
  }

  SingleChildScrollView EmergencyZoneButtons() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: buildButtonRow(
        [
          Text('Emergency1', style: TextStyle(fontSize: 13)),
          Text('Emergency2', style: TextStyle(fontSize: 13)),
          Text('Emergency3', style: TextStyle(fontSize: 13)),
        ],
        ['Emergency1', 'Emergency2', 'Emergency3'],
        Get.height * 0.08,
        Get.width * 0.42,
        Get.width * 0.03,
      ),
    );
  }

  Widget buildButtonRow(List<Widget> buttonContent, List<String> onPressRoutes,
      double height, double width, double gap) {
    return Row(
      children: buttonContent
          .asMap()
          .entries
          .map(
            (child) => Row(
              children: [
                FeatureButton(
                  onPressed: () {
                    print(onPressRoutes[child.key]);
                  },
                  child: child.value,
                  btnHeight: height,
                  btnWidth: width,
                ),
                SizedBox(width: gap),
              ],
            ),
          )
          .toList(),
    );
  }
}
