import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Utils {
  static errorSnackBar(String title, String message) {
    Get.snackbar(
      title,
      message,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      icon: Icon(
        Icons.error,
        color: Colors.white,
      ),
    );
  }
}
