import 'package:alotazrighat_application/repository/models/auth/login_user.dart';
import 'package:alotazrighat_application/repository/models/auth/send_code.dart';
import 'package:alotazrighat_application/repository/services/user_services.dart';
import 'package:alotazrighat_application/tools/network/http_status.dart';

class UserRepository {
  final UserService userService;
  UserRepository({required this.userService});

  Future<bool> testServer() => userService.getStateNetwork();

  Future<OperationResult> sendSMSCode(String phoneNumber) => userService
      .sendSMSCode(SendSmsCode(phoneNumber: phoneNumber, userType: "Customer"));

  Future<OperationResult> loginUser(String phoneNumber, password) => userService
      .loginUser(LoginUser(phoneNumber: phoneNumber, password: password));
}
