// To parse this JSON data, do
//
//     final motivationResponseModel = motivationResponseModelFromJson(jsonString);

import 'dart:convert';

MotivationResponseModel motivationResponseModelFromJson(String str) => MotivationResponseModel.fromJson(json.decode(str));

String motivationResponseModelToJson(MotivationResponseModel data) => json.encode(data.toJson());

class MotivationResponseModel {
  final String code;
  final String status;
  final String message;
  final Data data;

  MotivationResponseModel({
    required this.code,
    required this.status,
    required this.message,
    required this.data,
  });

  factory MotivationResponseModel.fromJson(Map<String, dynamic> json) => MotivationResponseModel(
        code: json["code"],
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  final int id;
  final String motivation;

  Data({
    required this.id,
    required this.motivation,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        motivation: json["motivation"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "motivation": motivation,
      };
}
