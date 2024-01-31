import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageController extends GetxController {
  final RxString _currentLocale = 'en_US'.obs;
  RxString get currentLocale => _currentLocale;

  void setLanguage() {
    // _currentLocale.value = _currentLocale.value == 'en_US' ? 'np_NP' : 'en_US';
    _currentLocale.value == 'en_US'
        ? Get.updateLocale(Locale('en', 'US'))
        : Get.updateLocale(Locale('np', 'NP'));
  }
}
