import 'package:e_palika/config/routes/routes.dart';
import 'package:e_palika/config/themes/colors.dart';
import 'package:e_palika/presentation/controllers/obscuretext_controller.dart';
import 'package:e_palika/presentation/controllers/signup_controller.dart';
import 'package:e_palika/presentation/widgets/custom_button.dart';
import 'package:e_palika/presentation/widgets/custom_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SignupView extends StatelessWidget {
  final SignupController signupController = Get.put(SignupController());
  SignupView({super.key});
  final ObscureTextController obscureTextController =
      Get.put(ObscureTextController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // resizeToAvoidBottomInset: false,
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
                          'signup'.tr,
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: CustomColors.primaryColor13,
                          ),
                        ),
                        SizedBox(height: 14),
                        nameTextField(),
                        SizedBox(height: 14),
                        phoneTextField(),
                        SizedBox(height: 14),
                        emailTextField(),
                        SizedBox(height: 14),
                        passwordTextField(),
                        SizedBox(height: 14),
                        dateOfBirth(context),

                        signupBtn(),
                        alreadyHaveAccount(),
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
                color: CustomColors.primaryColor.withOpacity(0.12),
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

  Widget nameTextField() {
    return CustomTextField1(
      title: 'name'.tr,
      controller: signupController.nameController,
    );
  }

  Widget phoneTextField() {
    return CustomTextField1(
      title: 'phone'.tr,
      controller: signupController.phoneController,
    );
  }

  Widget emailTextField() {
    return CustomTextField1(
      title: 'email'.tr,
      controller: signupController.emailController,
    );
  }

  Widget passwordTextField() {
    return Obx(
      () => CustomTextField1(
        title: 'password'.tr,
        controller: signupController.passwordController,
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

  Widget dateOfBirth(BuildContext context) {
    return CustomTextField1(
      title: 'birthday'.tr,
      suffixIcon: IconButton(
        onPressed: () async {
          _selectDate(context);
        },
        icon: Icon(CupertinoIcons.calendar),
        color: CustomColors.textFieldBorderColor,
      ),
      controller: signupController.dateController,
    );
  }

  //function for date picker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: signupController.selectedDate.value,
      firstDate: DateTime(1800),
      lastDate: DateTime(2025),
    );

    if (picked != null && picked != signupController.selectedDate.value) {
      signupController.selectedDate.value = picked;
    }
    signupController.dateController.text =
        DateFormat('yyyy-MM-dd').format(signupController.selectedDate.value);
  }

  Widget signupBtn() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 25),
      child: CustomElevatedButton(
        child: Text('signup'.tr),
        onPressed: () {
          signupController.signupApi();
        },
      ),
    );
  }

  Widget alreadyHaveAccount() {
    return RichText(
      text: TextSpan(
        style: TextStyle(fontSize: Get.height * 0.017),
        children: [
          TextSpan(
            text: 'alreadyHasAccount'.tr,
            style: TextStyle(color: CustomColors.primaryTextColor),
          ),
          TextSpan(
            text: 'login'.tr,
            style: const TextStyle(
              color: CustomColors.primaryColor,
              fontWeight: FontWeight.bold,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                // Get.until((route) => route.isFirst);
                Get.back();
                Get.offNamed(Routes.login);
              },
          ),
        ],
      ),
    );
  }
}
