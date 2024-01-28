import 'package:e_palika/config/routes/routes.dart';
import 'package:e_palika/presentation/widgets/custom_textfield.dart';
import 'package:e_palika/presentation/widgets/dialogbox_content.dart';
import 'package:e_palika/presentation/pages/forgot_password/widgets/forgot_pw_general_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return ForgotPasswordGeneralView(
      title: "Reset Password",
      icon: Image.asset(
        'assets/images/email.png',
        height: Get.height * 0.07,
      ),
      richText1: 'Enter Your Email Address \n',
      richText2: '\nWe\'ll send you a link to reset your password',
      inputField: emailTextField(),
      btnText: "Reset Password",
      onPressed: () {
        Get.defaultDialog(
          title: '',
          content: DialogBoxContent(
            btnText: 'Okay',
            middleText:
                "We've sent you a link to reset your password. Please check your inbox",
            centerIcon: Icon(Icons.check),
            onPressed: () {
              Get.back();
              Get.toNamed(Routes.newpassword);
            },
          ),
          barrierDismissible: true,
        );
      },
    );
  }

  CustomTextField1 emailTextField() {
    return CustomTextField1(
      hintText: "Enter Your Email Address",
    );
  }
}
