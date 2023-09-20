import 'package:alotazrighat_application/repository/models/auth/location.dart';
import 'package:json_annotation/json_annotation.dart';

part 'register_user.g.dart';

@JsonSerializable(fieldRename: FieldRename.none)
class RegisterUser {
  final String firstName;

  final String lastName;

  final String phoneNumber;

  final String telephone;

  final String address;

  final Location location;

  RegisterUser(
      {required this.firstName,
      required this.lastName,
      required this.phoneNumber,
      required this.telephone,
      required this.address,
      required this.location});

  Map<String, dynamic> toJson() => _$RegisterUserToJson(this);
}
