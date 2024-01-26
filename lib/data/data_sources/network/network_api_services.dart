import 'dart:convert';
import 'dart:io';

import 'package:e_palika/core/error/app_exceptions.dart';
import 'package:e_palika/core/utils/utils.dart';
import 'package:e_palika/data/data_sources/network/base_api_services.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices extends BaseApiServices {
  @override
  Future<dynamic> getApi(String url) async {
    if (kDebugMode) {
      print(url);
    }
    dynamic responseJson;
    try {
      final response = await http.get(Uri.parse(url));
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException('Please Check your internet connection');
    } on RequestTimedOut {
      throw RequestTimedOut('Request Timed Out');
    }
    return responseJson;
  }

  @override
  Future<dynamic> postApi(var data, String url) async {
    if (kDebugMode) {
      print(data);
      print(url);
    }
    dynamic responseJson;
    try {
      final response = await http.post(Uri.parse(url),
          headers: <String, String>{
            'Content-Type': 'application/json',
          },
          body: data);
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException('Please Check your internet connection');
    } on RequestTimedOut {
      throw RequestTimedOut('Request Timed Out');
    }

    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        dynamic errorResponseJson = jsonDecode(response.body);
        return errorResponseJson;
      default:
        Utils.errorSnackBar('Error', 'Error while communicating with server');
    }
  }
}
