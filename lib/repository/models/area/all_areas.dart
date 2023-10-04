import 'package:json_annotation/json_annotation.dart';

part 'all_areas.g.dart';

@JsonSerializable(fieldRename: FieldRename.none)
class AllAreas {
  final String id;

  final String name;

  factory AllAreas.fromJson(Map<String, dynamic> json) =>
      _$AllAreasFromJson(json);

  AllAreas({required this.id, required this.name});
}
