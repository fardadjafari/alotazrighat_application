// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddRequest _$AddRequestFromJson(Map<String, dynamic> json) => AddRequest(
      sex: json['sex'] as String,
      nurseSex: json['nurseSex'] as String?,
      address: json['address'] as String,
      location: Location.fromJson(json['location'] as Map<String, dynamic>),
      areaId: json['areaId'] as String,
      serviceTypeId: json['serviceTypeId'] as String,
      quantity: json['quantity'] as int,
      discountCode: json['discountCode'] as String?,
    );

Map<String, dynamic> _$AddRequestToJson(AddRequest instance) =>
    <String, dynamic>{
      'sex': instance.sex,
      'nurseSex': instance.nurseSex,
      'address': instance.address,
      'location': instance.location,
      'areaId': instance.areaId,
      'serviceTypeId': instance.serviceTypeId,
      'quantity': instance.quantity,
      'discountCode': instance.discountCode,
    };
