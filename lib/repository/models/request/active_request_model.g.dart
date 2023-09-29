// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'active_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActiveRequest _$ActiveRequestFromJson(Map<String, dynamic> json) =>
    ActiveRequest(
      requestCode: json['requestCode'] as String,
      serviceTitle: json['serviceTitle'] as String,
      serviceTypeTitle: json['serviceTypeTitle'] as String,
      createAt: json['createAt'] as String,
      nurseFirstName: json['nurseFirstName'] as String?,
      nurseLastName: json['nurseLastName'] as String?,
      nurseAvatar: json['nurseAvatar'] as String?,
      serviceQuantity: (json['serviceQuantity'] as num).toDouble(),
      finalPrice: (json['finalPrice'] as num).toDouble(),
      status: $enumDecode(_$RequestStatusEnumMap, json['status']),
      nurseLicenceCard: json['nurseLicenceCard'] as String,
      nursePhoneNumber: json['nursePhoneNumber'] as String?,
      sex: $enumDecode(_$SexTypeEnumMap, json['sex']),
    );

Map<String, dynamic> _$ActiveRequestToJson(ActiveRequest instance) =>
    <String, dynamic>{
      'requestCode': instance.requestCode,
      'serviceTitle': instance.serviceTitle,
      'serviceTypeTitle': instance.serviceTypeTitle,
      'createAt': instance.createAt,
      'nurseFirstName': instance.nurseFirstName,
      'nurseLastName': instance.nurseLastName,
      'nurseAvatar': instance.nurseAvatar,
      'serviceQuantity': instance.serviceQuantity,
      'finalPrice': instance.finalPrice,
      'status': _$RequestStatusEnumMap[instance.status]!,
      'nurseLicenceCard': instance.nurseLicenceCard,
      'nursePhoneNumber': instance.nursePhoneNumber,
      'sex': _$SexTypeEnumMap[instance.sex]!,
    };

const _$RequestStatusEnumMap = {
  RequestStatus.PendingToAccept: 'PendingToAccept',
  RequestStatus.TimeOut: 'TimeOut',
  RequestStatus.CancelByNurse: 'CancelByNurse',
  RequestStatus.RejectByCustomer: 'RejectByCustomer',
  RequestStatus.Accept: 'Accept',
  RequestStatus.RefundToCustomer: 'RefundToCustomer',
  RequestStatus.RejectByAdmin: 'RejectByAdmin',
  RequestStatus.PendingToPay: 'PendingToPay',
  RequestStatus.PayTimeOut: 'PayTimeOut',
  RequestStatus.Finish: 'Finish',
};

const _$SexTypeEnumMap = {
  SexType.Male: 'Male',
  SexType.Female: 'Female',
};
