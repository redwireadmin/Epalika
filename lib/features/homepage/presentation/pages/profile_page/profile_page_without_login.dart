import 'package:e_palika/config/routes/routes.dart';
import 'package:e_palika/config/themes/colors.dart';
import 'package:e_palika/core/utils/widgets/dialogbox_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePageWithoutLogin extends StatelessWidget {
  const ProfilePageWithoutLogin({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () {
      Get.defaultDialog(
        title: '',
        content: DialogBoxContent(
          btnText: 'Login',
          middleText: "Please Login first",
          centerIcon: Icon(Icons.check),
          onPressed: () {
            Get.back();
            Get.toNamed(Routes.login);
          },
        ),
        barrierDismissible: true,
      );
    });
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: CustomColors.primaryColor1,
          title: Text("Profile"),
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
          child: Center(
            child: Container(
              height: 50,
              width: 150,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.purple,
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: Offset(4, 4),
                    ),
                    BoxShadow(
                      color: Colors.white,
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: Offset(-4, -4),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
