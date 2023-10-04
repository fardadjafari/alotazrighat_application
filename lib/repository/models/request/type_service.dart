import 'package:alotazrighat_application/repository/models/request/detail_service.dart';
import 'package:json_annotation/json_annotation.dart';

part 'type_service.g.dart';

@JsonSerializable(fieldRename: FieldRename.none)
class TypeService {
  final String title;

  final bool isCountable;

  final String? rule;

  final String icon;

  final List<DetailService> types;

  TypeService(
      {required this.title,
      required this.isCountable,
      required this.rule,
      required this.icon,
      required this.types});

  factory TypeService.fromJson(Map<String, dynamic> json) =>
      _$TypeServiceFromJson(json);
}
