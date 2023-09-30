// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_request_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResultRequst _$ResultRequstFromJson(Map<String, dynamic> json) => ResultRequst(
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
      serviceUnitPrice: (json['serviceUnitPrice'] as num).toDouble(),
      discountAmountPrice: (json['discountAmountPrice'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ResultRequstToJson(ResultRequst instance) =>
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
      'serviceUnitPrice': instance.serviceUnitPrice,
      'discountAmountPrice': instance.discountAmountPrice,
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
