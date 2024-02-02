class UserModel {
  String? status;
  String? message;
  String? accessToken;

  UserModel({this.status, this.message, this.accessToken});

  UserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    accessToken = json['accessToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['accessToken'] = accessToken;
    return data;
  }
}
