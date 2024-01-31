import 'package:e_palika/config/themes/colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NoticePageView extends StatelessWidget {
  NoticePageView({super.key});
  List<String> notices = ['Hello', 'Second Notice'];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Notice"),
          backgroundColor: CustomColors.primaryColor1,
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
          child: ListView(
              children: notices
                  .map((e) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          child: ListTile(
                            leading: Text(e),
                          ),
                        ),
                      ))
                  .toList()),
        ),
      ),
    );
  }
}
