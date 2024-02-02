import 'package:e_palika/config/app_urls/app_urls.dart';
import 'package:e_palika/core/network/network_api_services.dart';

class NoticeRepository {
  final _apiServices = NetworkApiServices();
  Future<dynamic> noticeApi() async {
    dynamic response = _apiServices.getApi(AppUrls.getAllNotice);
    return response;
  }
}
