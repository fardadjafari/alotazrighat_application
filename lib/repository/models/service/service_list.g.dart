// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceList _$ServiceListFromJson(Map<String, dynamic> json) => ServiceList(
      service: (json['service'] as List<dynamic>)
          .map((e) => ServiceItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ServiceListToJson(ServiceList instance) =>
    <String, dynamic>{
      'service': instance.service,
    };
