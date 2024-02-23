// To parse this JSON data, do
//
//     final noticeModel = noticeModelFromJson(jsonString);

import 'dart:convert';

NoticeModel noticeModelFromJson(String str) =>
    NoticeModel.fromJson(json.decode(str));

String noticeModelToJson(NoticeModel data) => json.encode(data.toJson());

class NoticeModel {
  int statusCode;
  List<NoticeItemModel> data;
  String message;
  bool success;

  NoticeModel({
    required this.statusCode,
    required this.data,
    required this.message,
    required this.success,
  });

  factory NoticeModel.fromJson(Map<String, dynamic> json) => NoticeModel(
        statusCode: json["StatusCode"],
        data: List<NoticeItemModel>.from(
            json["data"].map((x) => NoticeItemModel.fromJson(x))),
        message: json["message"],
        success: json["success"],
      );

  Map<String, dynamic> toJson() => {
        "StatusCode": statusCode,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
        "success": success,
      };
}

class NoticeItemModel {
  String id;
  String title;
  String noticebody;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String? image;

  NoticeItemModel({
    required this.id,
    required this.title,
    required this.noticebody,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    this.image,
  });

  factory NoticeItemModel.fromJson(Map<String, dynamic> json) =>
      NoticeItemModel(
        id: json["_id"],
        title: json["title"],
        noticebody: json["noticebody"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "noticebody": noticebody,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "image": image,
      };
}
