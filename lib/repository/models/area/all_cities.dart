import 'package:json_annotation/json_annotation.dart';

part 'all_cities.g.dart';

@JsonSerializable(fieldRename: FieldRename.none)
class AllCities {
  final String id;

  final String name;

  AllCities({required this.id, required this.name});

  factory AllCities.fromJson(Map<String, dynamic> json) =>
      _$AllCitiesFromJson(json);
}
