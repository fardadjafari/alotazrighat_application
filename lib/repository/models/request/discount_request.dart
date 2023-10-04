import 'package:json_annotation/json_annotation.dart';

part 'discount_request.g.dart';

@JsonSerializable(fieldRename: FieldRename.none)
class DiscountCheckModel {
  final String code;

  DiscountCheckModel({required this.code});

  Map<String, dynamic> toJson() => _$DiscountCheckModelToJson(this);
}
