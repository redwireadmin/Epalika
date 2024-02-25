import 'package:e_palika/features/auth/presentation/controllers/user_pref_controller.dart';
import 'package:get/get.dart';

class CheckLoginController extends GetxController {
  UserPreferenceController userPreference = UserPreferenceController();

  RxBool checkLogin = false.obs;
  void isLogin() async {
    userPreference.getUser().then(
      (value) {
        print(value.accessToken.toString());
        if (value.accessToken.toString() == 'null') {
          checkLogin = false.obs;
        } else {
          checkLogin = true.obs;
        }
        print('CheckLoginController ${checkLogin.value}');
      },
    );
  }

  @override
  void onInit() {
    super.onInit();
    isLogin();
  }
}
