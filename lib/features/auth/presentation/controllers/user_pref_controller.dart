import 'package:e_palika/features/auth/data/models/login/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferenceController {
  Future<bool> saveUser(UserModel responseModel) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('accessToken', responseModel.accessToken.toString());
    return true;
  }

  Future<UserModel> getUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? token = sp.getString('accessToken');
    return UserModel(
      accessToken: token,
    );
  }

  Future<bool> removeUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.clear();
    return true;
  }
}
