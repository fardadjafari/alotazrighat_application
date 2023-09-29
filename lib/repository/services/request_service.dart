import 'dart:convert';

import 'package:alotazrighat_application/constants/constans_variable.dart';
import 'package:alotazrighat_application/repository/database/hive_table.dart';
import 'package:alotazrighat_application/repository/models/request/active_request_model.dart';
import 'package:alotazrighat_application/repository/models/request/reject_request.dart';
import 'package:alotazrighat_application/repository/models/service/service_item.dart';
import 'package:alotazrighat_application/repository/models/setting/profile_table.dart';
import 'package:alotazrighat_application/tools/network/http_status.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';

class RequestService {
  RequestService({
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

  // ignore: unused_element
  Future<String> _getToken() async {
    await Hive.openBox<ProfileModel>('settingTable');
    final box = Hive.box<ProfileModel>(HiveTable.boxSetting);

    var userInfo = box.getAt(0) as ProfileModel;

    return userInfo.token;
  }

  Future<String> getHeaderToken() async {
    await Hive.openBox<ProfileModel>('settingTable');
    final box = Hive.box<ProfileModel>(HiveTable.boxSetting);

    var userInfo = box.getAt(0) as ProfileModel;

    return userInfo.token;
  }

  Future<OperationResult> getMainService() async {
    var token = await _getToken();

    var response = await httpClient.get(getUrl(url: StaticVariable.service),
        options: Options(headers: {"Authorization": "Bearer $token"}));

    List<ServiceItem> serviceList = List<ServiceItem>.from(
        response.data.map((model) => ServiceItem.fromJson(model)));

    return OperationResult(serviceList,
        statusHttps: OperationResult.translateStatusHttps(response.statusCode),
        message: response.statusMessage);
  }

  Future<OperationResult> getActiveRequest() async {
    var token = await _getToken();

    var response = await httpClient.get(
        getUrl(url: StaticVariable.activeRequest),
        options: Options(headers: {"Authorization": "Bearer $token"}));

    List<ActiveRequest> requestList = List<ActiveRequest>.from(
        response.data.map((model) => ActiveRequest.fromJson(model)));

    return OperationResult(requestList,
        statusHttps: OperationResult.translateStatusHttps(response.statusCode),
        message: response.statusMessage);
  }

  Future<OperationResult> rejectRequest(String uniqCode) async {
    var token = await _getToken();

    var model = RejectNurse(requestCode: uniqCode);
    var jsonModel = jsonEncode(model.toJson());
    var response = await httpClient.post(
        getUrl(url: StaticVariable.rejectRequest),
        data: jsonModel,
        options: Options(headers: {"Authorization": "Bearer $token"}));

    return OperationResult(null,
        statusHttps: OperationResult.translateStatusHttps(response.statusCode),
        message: response.statusMessage);
  }
}
