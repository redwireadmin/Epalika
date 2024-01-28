import 'package:e_palika/config/themes/colors.dart';
import 'package:flutter/material.dart';

class NotificationPageView extends StatelessWidget {
  const NotificationPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Notifications"),
        ),
        body: Container(
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
        ),
      ),
    );
  }
}
