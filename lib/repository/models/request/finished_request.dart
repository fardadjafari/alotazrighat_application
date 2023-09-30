import 'package:json_annotation/json_annotation.dart';

part 'finished_request.g.dart';

@JsonSerializable(fieldRename: FieldRename.none)
class FinishedNurse {
  final String requestCode;

  final String rate;

  final String? feelingDescription;

  FinishedNurse(
      {required this.requestCode,
      required this.rate,
      required this.feelingDescription});

  Map<String, dynamic> toJson() => _$FinishedNurseToJson(this);
}
