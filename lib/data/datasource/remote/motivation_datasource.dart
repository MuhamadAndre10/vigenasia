import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:vigenasia/constant/api_config.dart';
import 'package:vigenasia/data/datasource/local/auth_local_datasource.dart';
import 'package:vigenasia/data/model/request/motivation_request_model.dart';
import 'package:vigenasia/data/model/response/motivation_response_model.dart';

class MotivationDatasource {
  Future<Either<String, MotivationResponseModel>> postMotivation(
      MotivationRequestModel model) async {
    var getToken = await AuthLocalDataSource().getToken;
    final res = await http.post(
      Uri.parse("${ApiConfig.baseUrl}/api/motivation"),
      body: jsonEncode(model.toJson()),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $getToken',
      },
    );

    final result = jsonDecode(res.body);

    if (res.statusCode == 200) {
      return Right(MotivationResponseModel.fromJson(result));
    } else {
      return Left(result['message']);
    }
  }
}
