// import 'package:e_palika/config/routes/routes.dart';
import 'package:e_palika/config/themes/colors.dart';
import 'package:e_palika/presentation/controllers/user_pref_controller.dart';
import 'package:flutter/material.dart';
// import 'package:get/get.dart';

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
        body: Text('body'),
        endDrawer: YourEndDrawerWidget(),
      ),
    );
  }
}

class YourEndDrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('End Drawer Header'),
          ),
          ListTile(
            title: Text('Item 1'),
            onTap: () {
              // Handle item tap
            },
          ),
          ListTile(
            title: Text('Item 2'),
            onTap: () {
              // Handle item tap
            },
          ),
        ],
      ),
    );
  }
}
