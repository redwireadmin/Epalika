import 'package:e_palika/config/routes/routes.dart';
import 'package:e_palika/config/themes/colors.dart';
import 'package:e_palika/presentation/controllers/obscuretext_controller.dart';
import 'package:e_palika/presentation/widgets/custom_textfield.dart';
import 'package:e_palika/presentation/widgets/dialogbox_content.dart';
import 'package:e_palika/presentation/widgets/forgot_pw_general_screen_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateNewPasswordView extends StatelessWidget {
  final ObscureTextController obscureTextController =
      Get.put(ObscureTextController());
  CreateNewPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return ForgotPasswordGeneralView(
      title: "Reset Password",
      icon: Image.asset(
        'assets/images/email.png',
        height: Get.height * 0.07,
      ),
      richText1: 'Reset Password \n',
      richText2: '\nCreate your new password',
      inputField: Column(
        children: [
          passwordTextField("New Password"),
          SizedBox(height: 20),
          passwordTextField("Confirm New Password"),
        ],
      ),
      btnText: "Create a New Password",
      onPressed: () {
        Get.defaultDialog(
          title: '',
          content: DialogBoxContent(
            middleText: "Yay! Your new password has been saved",
            centerIcon: Icon(Icons.check),
            onPressed: () {
              Get.offAllNamed(Routes.login);
            },
            btnText: 'Login Now',
          ),
          barrierDismissible: false,
        );
      },
    );
  }

  Widget passwordTextField(String label) {
    return Obx(
      () => CustomTextField1(
        hintText: label,
        obscureText: obscureTextController.obscureText.value,
        suffixIcon: IconButton(
          onPressed: () {
            obscureTextController.obscureText.value =
                !obscureTextController.obscureText.value;
          },
          icon: Icon(
            obscureTextController.obscureText.value
                ? CupertinoIcons.eye_slash
                : CupertinoIcons.eye,
            size: 20,
          ),
          color: CustomColors.textFieldBorderColor,
        ),
      ),
    );
  }
}
