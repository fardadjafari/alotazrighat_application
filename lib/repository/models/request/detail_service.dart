import 'package:json_annotation/json_annotation.dart';

part 'detail_service.g.dart';

@JsonSerializable(fieldRename: FieldRename.none)
class DetailService {
  final String id;

  final String name;

  final double price;

  DetailService({required this.id, required this.name, required this.price});

  factory DetailService.fromJson(Map<String, dynamic> json) =>
      _$DetailServiceFromJson(json);
}
