import 'package:e_palika/config/app_urls/app_urls.dart';
import 'package:e_palika/core/network/network_api_services.dart';

class SignupRepository {
  final _apiServices = NetworkApiServices();
  Future<dynamic> signupApi(var data) async {
    dynamic response = _apiServices.postApi(data, AppUrls.signup);
    return response;
  }
}
