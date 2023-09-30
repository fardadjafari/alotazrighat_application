import 'package:alotazrighat_application/repository/models/request/enums/request_status.dart';
import 'package:json_annotation/json_annotation.dart';

part 'result_request_list.g.dart';

@JsonSerializable(fieldRename: FieldRename.none)
class ResultRequst {
  final String requestCode;

  final String serviceTitle;

  final String serviceTypeTitle;

  final String createAt;

  final String? nurseFirstName;

  final String? nurseLastName;

  final String? nurseAvatar;

  final double serviceQuantity;

  final double finalPrice;

  final RequestStatus status;

  final double serviceUnitPrice;

  final double? discountAmountPrice;

  factory ResultRequst.fromJson(Map<String, dynamic> json) =>
      _$ResultRequstFromJson(json);

  ResultRequst(
      {required this.requestCode,
      required this.serviceTitle,
      required this.serviceTypeTitle,
      required this.createAt,
      required this.nurseFirstName,
      required this.nurseLastName,
      required this.nurseAvatar,
      required this.serviceQuantity,
      required this.finalPrice,
      required this.status,
      required this.serviceUnitPrice,
      required this.discountAmountPrice});
}
