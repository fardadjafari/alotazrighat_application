import 'package:alotazrighat_application/repository/models/service/service_item.dart';
import 'package:json_annotation/json_annotation.dart';

part 'service_list.g.dart';

@JsonSerializable(fieldRename: FieldRename.none)
class ServiceList {
  final List<ServiceItem> service;

  ServiceList({required this.service});

  Map<String, dynamic> toJson() => _$ServiceListToJson(this);

  factory ServiceList.fromJson(Map<String, dynamic> json) =>
      _$ServiceListFromJson(json);
}
