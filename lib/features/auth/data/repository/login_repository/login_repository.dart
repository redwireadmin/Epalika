import 'package:e_palika/config/app_urls/app_urls.dart';
import 'package:e_palika/core/network/network_api_services.dart';

class LoginRepository {
  final _apiServices = NetworkApiServices();
  Future<dynamic> loginApi(var data) async {
    dynamic response = _apiServices.postApi(data, AppUrls.login);
    return response;
  }
}
