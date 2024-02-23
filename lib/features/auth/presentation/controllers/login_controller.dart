import 'dart:convert';
import 'package:e_palika/config/routes/routes.dart';
import 'package:e_palika/core/utils/utils.dart';
import 'package:e_palika/features/auth/data/models/login/user_model.dart';
import 'package:e_palika/features/auth/data/repository/login_repository/login_repository.dart';
import 'package:e_palika/features/auth/presentation/controllers/check_login_controller.dart';
import 'package:e_palika/features/auth/presentation/controllers/user_pref_controller.dart';
import 'package:e_palika/core/utils/widgets/dialogbox_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  RxBool loading = false.obs;

  final CheckLoginController checkLoginController =
      Get.find<CheckLoginController>();
  final _api = LoginRepository();
  //
  UserPreferenceController userPreference = UserPreferenceController();
  //

  //
  late TextEditingController emailController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();

  void loginApi() {
    loading.value = true;

    final Map<String, dynamic> requestBody = {
      "email": emailController.text,
      "password": passwordController.text,
    };
    var body = jsonEncode(requestBody);
    _api.loginApi(body).then((value) {
      loading.value = false;

      if (value['status'] == 'success') {
        checkLoginController.checkLogin.value = true;
        userPreference.saveUser(UserModel.fromJson(value)).then((value) {
          Get.offAllNamed(Routes.land);
        });
      } else if (value['message'] == 'Email not verified') {
        Get.defaultDialog(
          title: value['message'],
          content: DialogBoxContent(
            middleText: 'Verify Your Email First',
            centerIcon: Icon(Icons.error),
            onPressed: () {
              Get.toNamed(Routes.verifyotp);
            },
            btnText: 'Verify',
          ),
          barrierDismissible: true,
        );
      }

      Get.snackbar('Login ${value['status']}', value['message'],
          colorText: Colors.white);
    }).catchError((error, stackTrace) {
      Utils.errorSnackBar('Error', error.toString());
    });
  }
}
