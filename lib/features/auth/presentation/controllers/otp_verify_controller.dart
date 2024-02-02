import 'dart:convert';

import 'package:e_palika/config/routes/routes.dart';
import 'package:e_palika/core/utils/utils.dart';
import 'package:e_palika/features/auth/data/repository/signup_repository/verifyotp_repository.dart';
import 'package:e_palika/features/auth/presentation/controllers/login_controller.dart';
import 'package:e_palika/features/auth/presentation/controllers/signup_controller.dart';
import 'package:e_palika/core/utils/widgets/dialogbox_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpVerifyController extends GetxController {
  final _api = OtpVerifyRepository();
  LoginController loginController = Get.put(LoginController());
  SignupController signupController = Get.put(SignupController());
  final pinCodeTextFieldController = TextEditingController();
  void otpApi() {
    final Map<String, dynamic> requestBody = {
      "otp": pinCodeTextFieldController.text,
      "email": signupController.emailController.text.isNotEmpty
          ? signupController.emailController.text
          : loginController.emailController.text,
    };
    print(signupController.emailController.text);
    var body = jsonEncode(requestBody);
    _api.otpVerifyApi(body).then((value) {
      if (value['status'] == 'success') {
        Get.defaultDialog(
          title: '',
          content: DialogBoxContent(
            middleText: value['message'],
            centerIcon: Icon(Icons.check),
            onPressed: () {
              Get.offAllNamed(Routes.login);
            },
            btnText: 'Login Now',
          ),
          barrierDismissible: false,
        );
      }
      Get.snackbar('Otp Verification ${value['status']}', value['message'],
          colorText: Colors.white);
    }).catchError((error, stackTrace) {
      Utils.errorSnackBar('Error', error.toString());
    });
  }
}
