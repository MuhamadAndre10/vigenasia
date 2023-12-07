// To parse this JSON data, do
//
//     final registerRequestModel = registerRequestModelFromJson(jsonString);

import 'dart:convert';

RegisterRequestModel registerRequestModelFromJson(String str) => RegisterRequestModel.fromJson(json.decode(str));

String registerRequestModelToJson(RegisterRequestModel data) => json.encode(data.toJson());

class RegisterRequestModel {
  final String name;
  final String email;
  final String profesi;
  final String password;

  RegisterRequestModel({
    required this.name,
    required this.email,
    required this.profesi,
    required this.password,
  });

  factory RegisterRequestModel.fromJson(Map<String, dynamic> json) => RegisterRequestModel(
        name: json["name"],
        email: json["email"],
        profesi: json["profesi"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "profesi": profesi,
        "password": password,
      };
}
