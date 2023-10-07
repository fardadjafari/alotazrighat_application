import 'dart:convert';

import 'package:alotazrighat_application/constants/constans_variable.dart';
import 'package:alotazrighat_application/repository/database/hive_table.dart';
import 'package:alotazrighat_application/repository/models/auth/login_decoder.dart';
import 'package:alotazrighat_application/repository/models/auth/login_user.dart';
import 'package:alotazrighat_application/repository/models/auth/register_user.dart';
import 'package:alotazrighat_application/repository/models/auth/send_code.dart';
import 'package:alotazrighat_application/repository/models/setting/profile_table.dart';
import 'package:alotazrighat_application/tools/network/http_status.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';

class UserService {
  UserService({
    Dio? dioClient,
  }) : httpClient = dioClient ??
            Dio(BaseOptions(
              headers: {
                'Content-Type': 'application/json',
              },
              validateStatus: (statusCode) {
                if (statusCode == null) {
                  return false;
                }
                if (statusCode == 400) {
                  return true;
                } else {
                  return statusCode >= 200 && statusCode < 300;
                }
              },
            ));
  final Dio httpClient;

  String getUrl({
    required String url,
  }) {
    return '${StaticVariable.baseUrl}$url';
  }

  Future<bool> getStateNetwork() async {
    try {
      final Connectivity connectivity = Connectivity();
      var result = await connectivity.checkConnectivity();
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        return true;
      }
      return false;
    } on PlatformException catch (_) {
      return false;
    }
  }

  Future<OperationResult> sendSMSCode(SendSmsCode smsModel) async {
    var jsonModel = jsonEncode(smsModel.toJson());
    var response = await httpClient
        .post(getUrl(url: StaticVariable.smsSendCode), data: jsonModel);

    return OperationResult(null,
        httpCode: response.statusCode,
        statusHttps: OperationResult.translateStatusHttps(response.statusCode),
        message: response.data.toString());
  }

  Future<OperationResult> loginUser(LoginUser loginUser) async {
    var jsonModel = jsonEncode(loginUser.toJson());
    var response = await httpClient.post(getUrl(url: StaticVariable.loginUser),
        data: jsonModel);
    if (response.statusCode == 200) {
      LoginDecoder model = LoginDecoder.fromJson(response.data);

      var result = await _createTableSetting(
          model.token, model.avatar, model.role, model.userFullName);

      if (result) {
        return OperationResult(null, statusHttps: StatusHttps.ok);
      } else {
        return OperationResult(null, statusHttps: StatusHttps.faildRequest);
      }
    }

    return OperationResult(null,
        statusHttps: StatusHttps.badRequest, httpCode: 400);
  }

  Future<bool> _createTableSetting(String token, avatar, fullName, role) async {
    try {
      await Hive.openBox<ProfileModel>('settingTable');
      final box = Hive.box<ProfileModel>(HiveTable.boxSetting);
      final model = ProfileModel(
          token: token, avatar: avatar, role: role, userFullName: fullName);

      box.add(model);

      return true;
    } catch (e) {
      return false;
    }
  }

  Future<OperationResult> registerUser(RegisterUser registerUser) async {
    var jsonModel = jsonEncode(registerUser.toJson());
    var response = await httpClient
        .post(getUrl(url: StaticVariable.registerUser), data: jsonModel);
    return OperationResult(null,
        statusHttps: OperationResult.translateStatusHttps(response.statusCode),
        message: response.data);
  }

  Future<OperationResult> validateToken(String token) async {
    var response = await httpClient.get(getUrl(url: StaticVariable.service),
        options: Options(headers: {"Authorization": "Bearer $token"}));

    return OperationResult(null,
        statusHttps: OperationResult.translateStatusHttps(response.statusCode));
  }
}
