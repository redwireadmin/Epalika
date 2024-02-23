import 'package:e_palika/features/auth/presentation/controllers/user_pref_controller.dart';
import 'package:get/get.dart';

class CheckLoginController extends GetxController {
  UserPreferenceController userPreference = UserPreferenceController();

  late RxBool checkLogin = false.obs;
}
