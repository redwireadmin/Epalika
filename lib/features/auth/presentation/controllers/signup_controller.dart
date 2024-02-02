import 'dart:convert';

import 'package:e_palika/config/routes/routes.dart';
import 'package:e_palika/core/utils/utils.dart';
import 'package:e_palika/features/auth/data/repository/signup_repository/signup_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  final _api = SignupRepository();
  //
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final dateController = TextEditingController();
  final Rx<DateTime> selectedDate = DateTime.now().obs;
  final phoneController = TextEditingController();

  void signupApi() {
    final Map<String, dynamic> requestBody = {
      "name": nameController.text,
      "phoneNumber": phoneController.text,
      "email": emailController.text,
      "birthday": dateController.text,
      "password": passwordController.text,
    };
    var body = jsonEncode(requestBody);
    _api.signupApi(body).then((value) {
      if (value['status'] == 'success') {
        Get.toNamed(Routes.verifyotp);
      }
      Get.snackbar('Signup ${value['status']}', value['message'],
          colorText: Colors.white);
    }).catchError((error, stackTrace) {
      Utils.errorSnackBar('Error', error.toString());
    });
  }
}
