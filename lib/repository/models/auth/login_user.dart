import 'package:json_annotation/json_annotation.dart';

part 'login_user.g.dart';

@JsonSerializable(fieldRename: FieldRename.none)
class LoginUser {
  final String phoneNumber;

  final String password;

  LoginUser({required this.phoneNumber, required this.password});

    Map<String, dynamic> toJson() => _$LoginUserToJson(this);
}
