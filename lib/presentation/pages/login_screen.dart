import 'package:e_palika/config/routes/routes.dart';
import 'package:e_palika/config/themes/colors.dart';
import 'package:e_palika/presentation/controllers/language_controller.dart';
import 'package:e_palika/presentation/controllers/login_controller.dart';
import 'package:e_palika/presentation/controllers/obscuretext_controller.dart';
import 'package:e_palika/presentation/pages/signup_screen.dart';
import 'package:e_palika/presentation/widgets/custom_button.dart';
import 'package:e_palika/presentation/widgets/custom_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final LoginController loginController = Get.put(LoginController());
  final ObscureTextController obscureTextController =
      Get.put(ObscureTextController());

  final LanguageController languageController = Get.put(LanguageController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            topContainer(), //background with logo
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  SizedBox(
                    height: Get.height * 0.35,
                  ),
                  Container(
                    width: Get.width,
                    padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
                    decoration: const BoxDecoration(
                      color: CustomColors.appWhite,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(25),
                        topLeft: Radius.circular(25),
                      ),
                    ),
                    child: Column(
                      children: [
                        //todo
                        Text(
                          'login'.tr,
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: CustomColors.primaryColor13,
                          ),
                        ),
                        SizedBox(height: 14),
                        emailTextField(),
                        SizedBox(height: 14),
                        passwordTextField(),
                        loginBtn(),
                        forgotPassword(),
                        SizedBox(height: 30),
                        dontHaveAccount(),
                        SizedBox(height: 60),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     Text('English'),
                        //     Obx(() => Switch(
                        //           value:
                        //               languageController.currentLocale.value ==
                        //                   'np_NP',
                        //           onChanged: (value) {
                        //             languageController.toggleLanguage();
                        //           },
                        //         )),
                        //     Text('Nepali'),
                        //   ],
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget topContainer() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [CustomColors.primaryColor12, CustomColors.primaryColor1],
          stops: [0.25, 0.75],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      height: Get.height * 0.4,
      width: Get.width * 1,
      child: Padding(
        padding: const EdgeInsets.all(80),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            // color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: CustomColors.primaryColor.withOpacity(0.25),
                spreadRadius: 3,
                blurRadius: 30,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: Image.asset(
            'assets/images/logo1.png',
            fit: BoxFit.fitHeight,
          ),
        ),
      ),
    );
  }

  Widget emailTextField() {
    return CustomTextField1(
      title: 'email/phone'.tr,
      controller: loginController.emailController,
    );
  }

  Widget passwordTextField() {
    return Obx(
      () => CustomTextField1(
        title: 'password'.tr,
        controller: loginController.passwordController,
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

  Widget forgotPassword() {
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.forgotpassword);
      },
      child: Container(
        alignment: Alignment.center,
        child: Text(
          'forgotPassword'.tr,
          style: TextStyle(
              color: CustomColors.primaryColor,
              fontSize: Get.height * 0.017,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget loginBtn() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 25),
      child: CustomElevatedButton(
        child: Text('login'.tr),
        onPressed: () {
          loginController.loginApi();
        },
      ),
    );
  }

  Widget dontHaveAccount() {
    return RichText(
      text: TextSpan(
        style: TextStyle(fontSize: Get.height * 0.017),
        children: [
          TextSpan(
            text: 'dontHaveAccount'.tr,
            style: TextStyle(color: CustomColors.primaryTextColor),
          ),
          TextSpan(
            text: 'signup'.tr,
            style: const TextStyle(
              color: CustomColors.primaryColor,
              fontWeight: FontWeight.bold,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Get.to(() => SignupView());
              },
          ),
        ],
      ),
    );
  }
}
