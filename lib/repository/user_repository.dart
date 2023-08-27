import 'package:alotazrighat_application/repository/services/user_services.dart';

class UserRepository {
  final UserService userService;
  UserRepository({required this.userService});

  Future<bool> testServer() => userService.getStateNetwork();
}
