import 'package:json_annotation/json_annotation.dart';

part 'reject_request.g.dart';

@JsonSerializable(fieldRename: FieldRename.none)
class RejectNurse {
  final String requestCode;

  RejectNurse({required this.requestCode});

  Map<String, dynamic> toJson() => _$RejectNurseToJson(this);
}
