import 'package:e_palika/config/app_urls/app_urls.dart';
import 'package:e_palika/data/data_sources/network/network_api_services.dart';

class OtpVerifyRepository {
  final _apiServices = NetworkApiServices();
  Future<dynamic> otpVerifyApi(var data) async {
    dynamic response = _apiServices.postApi(data, AppUrls.otpVerify);
    return response;
  }
}
