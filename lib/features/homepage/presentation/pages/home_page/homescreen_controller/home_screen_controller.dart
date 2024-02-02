import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt currentIndexSlider = 0.obs;
  void updatePageIndicator(index) {
    currentIndexSlider.value = index;
  }
}
