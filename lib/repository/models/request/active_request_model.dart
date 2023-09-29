import 'package:alotazrighat_application/repository/enums/sex.dart';
import 'package:alotazrighat_application/repository/models/request/enums/request_status.dart';
import 'package:json_annotation/json_annotation.dart';

part 'active_request_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.none)
class ActiveRequest {
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

  final String nurseLicenceCard;

  final String? nursePhoneNumber;

  final SexType sex;

  ActiveRequest(
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
      required this.nurseLicenceCard,
      required this.nursePhoneNumber,
      required this.sex});

  factory ActiveRequest.fromJson(Map<String, dynamic> json) =>
      _$ActiveRequestFromJson(json);
}
