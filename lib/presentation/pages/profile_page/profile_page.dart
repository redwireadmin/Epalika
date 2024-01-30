import 'package:e_palika/config/routes/routes.dart';
import 'package:e_palika/config/themes/colors.dart';
import 'package:e_palika/presentation/widgets/custom_button.dart';
import 'package:e_palika/presentation/widgets/dialogbox_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePageWithoutLogin extends StatelessWidget {
  const ProfilePageWithoutLogin({super.key});

  void showLoginDialogBox() {
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
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
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
            child: CustomElevatedButton(
              child: Text("Login Now"),
              onPressed: () {
                showLoginDialogBox();
              },
            ),
          ),
        ),
      ),
    );
  }
}
