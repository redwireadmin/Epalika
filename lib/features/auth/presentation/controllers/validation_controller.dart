import 'package:e_palika/features/auth/presentation/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ValidationController extends GetxController {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final LoginController loginController = Get.put(LoginController());
  var email = '';
  var password = '';

  @override
  void onInit() {
    super.onInit();
    loginController.emailController = TextEditingController();
    loginController.passwordController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    loginController.emailController.dispose();
    loginController.passwordController.dispose();
  }

  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return "Provide valid Email";
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.length < 6) {
      return "Password must be of 6 characters";
    }
    return null;
  }

  bool checkLogin() {
    final isValid = loginFormKey.currentState!.validate();
    if (!isValid) {
      return false;
    }
    loginFormKey.currentState!.save();
    return true;
  }
}
