import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';
import 'package:vigenasia/constant/api_config.dart';
import 'package:vigenasia/data/model/request/logn_request_model.dart';
import 'package:vigenasia/data/model/request/register_request_model.dart';
import 'package:vigenasia/data/model/response/login_response_model.dart';
import 'package:vigenasia/data/model/response/register_response_model.dart';

class AuthDataSource {
  Future<Either<String, RegisterResponseModel>> register(
      RegisterRequestModel registerData) async {
    final res = await http.post(
      Uri.parse('${ApiConfig.baseUrl}/api/register'),
      body: jsonEncode(registerData.toJson()),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    final data = jsonDecode(res.body);

    if (res.statusCode == 200) {
      return Right(RegisterResponseModel.fromJson(data));
    } else {
      return Left(data['message']);
    }
  }

  Future<Either<String, LoginResponseModel>> login(
      LoginRequestModel loginData) async {
    final res = await http.post(
      Uri.parse('${ApiConfig.baseUrl}/api/login'),
      body: jsonEncode(loginData.toJson()),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    final data = jsonDecode(res.body);

    if (res.statusCode == 200) {
      return Right(LoginResponseModel.fromJson(data));
    } else {
      return Left(data['message']);
    }
  }
}
