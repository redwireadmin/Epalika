import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt currentIndexSlider = 0.obs;
  void updatePageIndicator(index) {
    print(currentIndexSlider.value);
    currentIndexSlider.value = index;
  }
}
