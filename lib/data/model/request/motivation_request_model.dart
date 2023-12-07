// To parse this JSON data, do
//
//     final motivationRequestModel = motivationRequestModelFromJson(jsonString);

import 'dart:convert';

MotivationRequestModel motivationRequestModelFromJson(String str) => MotivationRequestModel.fromJson(json.decode(str));

String motivationRequestModelToJson(MotivationRequestModel data) => json.encode(data.toJson());

class MotivationRequestModel {
  final String motivation;

  MotivationRequestModel({
    required this.motivation,
  });

  factory MotivationRequestModel.fromJson(Map<String, dynamic> json) => MotivationRequestModel(
        motivation: json["motivation"],
      );

  Map<String, dynamic> toJson() => {
        "motivation": motivation,
      };
}
