import 'package:json_annotation/json_annotation.dart';

part 'response_request.g.dart';

@JsonSerializable(fieldRename: FieldRename.none)
class ResponseRequest {
  final String requestCode;

  ResponseRequest({required this.requestCode});

  factory ResponseRequest.fromJson(Map<String, dynamic> json) =>
      _$ResponseRequestFromJson(json);
}
