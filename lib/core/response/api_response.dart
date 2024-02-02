import 'package:e_palika/core/response/status.dart';

class ApiResponse<T> {
  Status? status;
  T? data;
  String? message;
  ApiResponse({this.status, this.data, this.message});

  ApiResponse.loading() : status = Status.loading;
  ApiResponse.comppleted() : status = Status.completed;
  ApiResponse.error() : status = Status.error;

  @override
  String toString() {
    return "Status : $status \n Message: $message \n Data: $data ";
  }
}
