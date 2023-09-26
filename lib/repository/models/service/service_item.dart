import 'package:json_annotation/json_annotation.dart';

part 'service_item.g.dart';

@JsonSerializable(fieldRename: FieldRename.none)
class ServiceItem {
  final String title;

  final String uniqueCode;

  final String icon;

  ServiceItem(
      {required this.title, required this.uniqueCode, required this.icon});

  Map<String, dynamic> toJson() => _$ServiceItemToJson(this);

  factory ServiceItem.fromJson(Map<String, dynamic> json) =>
      _$ServiceItemFromJson(json);
}
