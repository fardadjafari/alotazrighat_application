import 'package:alotazrighat_application/repository/models/auth/location.dart';
import 'package:json_annotation/json_annotation.dart';

part 'add_request.g.dart';

@JsonSerializable(fieldRename: FieldRename.none)
class AddRequest {
  final String sex;

  final String? nurseSex;

  final String address;

  final Location location;

  final String areaId;

  final String serviceTypeId;

  final int quantity;

  final String? discountCode;

  AddRequest(
      {required this.sex,
      required this.nurseSex,
      required this.address,
      required this.location,
      required this.areaId,
      required this.serviceTypeId,
      required this.quantity,
      required this.discountCode});

  Map<String, dynamic> toJson() => _$AddRequestToJson(this);
}
