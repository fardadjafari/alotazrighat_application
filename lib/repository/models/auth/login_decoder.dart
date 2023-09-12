import 'package:json_annotation/json_annotation.dart';

part 'login_decoder.g.dart';

@JsonSerializable(fieldRename: FieldRename.none)
class LoginDecoder {
  final String token;

  final String userFullName;

  final String avatar;

  final String role;

  LoginDecoder(
      {required this.userFullName,
      required this.avatar,
      required this.role,
      required this.token});

  factory LoginDecoder.fromJson(Map<String, dynamic> json) =>
      _$LoginDecoderFromJson(json);
}
