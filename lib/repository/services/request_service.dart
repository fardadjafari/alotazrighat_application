import 'dart:convert';

import 'package:alotazrighat_application/constants/constans_variable.dart';
import 'package:alotazrighat_application/repository/database/hive_table.dart';
import 'package:alotazrighat_application/repository/models/area/all_areas.dart';
import 'package:alotazrighat_application/repository/models/area/all_cities.dart';
import 'package:alotazrighat_application/repository/models/request/active_request_model.dart';
import 'package:alotazrighat_application/repository/models/request/add_request.dart';
import 'package:alotazrighat_application/repository/models/request/all_request.dart';
import 'package:alotazrighat_application/repository/models/request/discount_request.dart';
import 'package:alotazrighat_application/repository/models/request/enums/request_status.dart';
import 'package:alotazrighat_application/repository/models/request/finished_request.dart';
import 'package:alotazrighat_application/repository/models/request/reject_request.dart';
import 'package:alotazrighat_application/repository/models/request/type_service.dart';
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

  Future<OperationResult> finishRequest(FinishedNurse finishedNurse) async {
    var token = await _getToken();

    var jsonModel = jsonEncode(finishedNurse.toJson());
    var response = await httpClient.post(
        getUrl(url: StaticVariable.finishedRequest),
        data: jsonModel,
        options: Options(headers: {"Authorization": "Bearer $token"}));

    return OperationResult(null,
        statusHttps: OperationResult.translateStatusHttps(response.statusCode),
        message: response.statusMessage);
  }

  Future<OperationResult> getAllRequest() async {
    var token = await _getToken();
    var to = DateTime.now();
    var from = DateTime(to.year, to.month - 1, to.day);

    var response = await httpClient.get(
        getUrl(url: StaticVariable.getAllRequest),
        options: Options(headers: {"Authorization": "Bearer $token"}),
        queryParameters: {
          "page": "1",
          "from": "$from",
          "to": "$to",
          "status": RequestStatus.Finish.name
        });
    //List<ResultRequst> requestList = List<ResultRequst>.from(
    //  response.data.map((model) => ResultRequst.fromJson(model)));

    var result = AllRequest.fromJson(response.data);

    return OperationResult(result.result,
        statusHttps: OperationResult.translateStatusHttps(response.statusCode),
        message: response.statusMessage);
  }

  Future<OperationResult> getCity() async {
    var token = await _getToken();

    var response = await httpClient.get(getUrl(url: StaticVariable.allCities),
        options: Options(headers: {"Authorization": "Bearer $token"}));

    List<AllCities> cities = List<AllCities>.from(
        response.data.map((model) => AllCities.fromJson(model)));

    return OperationResult(cities,
        statusHttps: OperationResult.translateStatusHttps(response.statusCode),
        message: response.statusMessage);
  }

  Future<OperationResult> getArea(String cityId) async {
    var token = await _getToken();

    var response = await httpClient.get(
        getUrl(url: StaticVariable.allArea + cityId),
        options: Options(headers: {"Authorization": "Bearer $token"}));

    List<AllAreas> areas = List<AllAreas>.from(
        response.data.map((model) => AllAreas.fromJson(model)));

    return OperationResult(areas,
        statusHttps: OperationResult.translateStatusHttps(response.statusCode),
        message: response.statusMessage);
  }

  Future<OperationResult> getTypeService(String uniqueCode) async {
    var token = await _getToken();

    var response = await httpClient.get(
        getUrl(url: StaticVariable.detailService + uniqueCode),
        options: Options(headers: {"Authorization": "Bearer $token"}));

    TypeService serviceDetail = TypeService.fromJson(response.data);

    return OperationResult(serviceDetail,
        statusHttps: OperationResult.translateStatusHttps(response.statusCode),
        message: response.statusMessage);
  }

  Future<OperationResult> checkApplayDiscountCode(
      DiscountCheckModel discountCheckModel) async {
    var token = await _getToken();

    var jsonModel = jsonEncode(discountCheckModel.toJson());
    var response = await httpClient.post(
        getUrl(url: StaticVariable.discountApplaied),
        options: Options(headers: {"Authorization": "Bearer $token"}),
        data: jsonModel);

    return OperationResult(null,
        statusHttps: OperationResult.translateStatusHttps(response.statusCode),
        message: response.statusMessage);
  }

  Future<OperationResult> addRequest(AddRequest addRequest) async {
    var token = await _getToken();

    var jsonModel = jsonEncode(addRequest.toJson());
    var response = await httpClient.post(getUrl(url: StaticVariable.addRequest),
        options: Options(headers: {"Authorization": "Bearer $token"}),
        data: jsonModel);

    return OperationResult(null,
        statusHttps: OperationResult.translateStatusHttps(response.statusCode),
        message: response.statusMessage);
  }
}
