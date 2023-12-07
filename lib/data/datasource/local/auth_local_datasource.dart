import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:vigenasia/data/model/response/login_response_model.dart';

class AuthLocalDataSource {
  Future<String> getToken() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final res = pref.getString('auth') ?? '';
    final data = LoginResponseModel.fromJson(jsonDecode(res));
    return data.data.token;
  }

  Future<bool> saveAuthData(LoginResponseModel model) async {
    final pref = await SharedPreferences.getInstance();
    final res = await pref.setString('auth', jsonEncode(model.toJson()));
    await pref.setBool("everLaunced", true);
    return res;
  }

  Future<Data> getAuthData() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final res = pref.getString('auth') ?? '';
    final data = LoginResponseModel.fromJson(jsonDecode(res));
    return data.data;
  }

  Future<bool> removeAuthData() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final res = await pref.remove('auth');
    return res;
  }

  Future<bool> isLogin() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final res = pref.getString('auth') ?? '';
    return res.isNotEmpty;
  }

  Future<bool> getEverLaunched() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final res = pref.getBool("everLaunched") ?? false;
    return res;
  }
}
