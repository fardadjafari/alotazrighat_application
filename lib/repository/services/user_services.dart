import 'dart:io';
import 'package:alotazrighat_application/constants/constans_variable.dart';
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
      final result = await InternetAddress.lookup('https://alotazrighat.com/');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
      return false;
    } on SocketException catch (_) {
      return false;
    }
  }
}
