import 'package:json_annotation/json_annotation.dart';

part 'send_code.g.dart';

@JsonSerializable(fieldRename: FieldRename.none)
class SendSmsCode {
  final String phoneNumber;

  final String userType;

  SendSmsCode({required this.userType, required this.phoneNumber});

  Map<String, dynamic> toJson() => _$SendSmsCodeToJson(this);
}
