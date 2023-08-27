import 'package:alotazrighat_application/constants/constans_variable.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class UserService {
  UserService({
    http.Client? httpClient,
  }) : httpClient = httpClient ?? http.Client();
  final Client httpClient;

  Uri getUrl({
    required String url,
  }) {
    return Uri.parse('$StaticVariable.baseUrl/$url');
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
}
