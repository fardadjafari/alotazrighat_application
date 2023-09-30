// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchRequest _$SearchRequestFromJson(Map<String, dynamic> json) =>
    SearchRequest(
      page: json['page'] as int,
      from: json['from'] as String,
      to: json['to'] as String,
      status: $enumDecode(_$RequestStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$SearchRequestToJson(SearchRequest instance) =>
    <String, dynamic>{
      'page': instance.page,
      'from': instance.from,
      'to': instance.to,
      'status': _$RequestStatusEnumMap[instance.status]!,
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
