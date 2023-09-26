// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceItem _$ServiceItemFromJson(Map<String, dynamic> json) => ServiceItem(
      title: json['title'] as String,
      uniqueCode: json['uniqueCode'] as String,
      icon: json['icon'] as String,
    );

Map<String, dynamic> _$ServiceItemToJson(ServiceItem instance) =>
    <String, dynamic>{
      'title': instance.title,
      'uniqueCode': instance.uniqueCode,
      'icon': instance.icon,
    };
