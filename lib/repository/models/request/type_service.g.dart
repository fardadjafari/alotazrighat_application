// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'type_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TypeService _$TypeServiceFromJson(Map<String, dynamic> json) => TypeService(
      title: json['title'] as String,
      isCountable: json['isCountable'] as bool,
      rule: json['rule'] as String?,
      icon: json['icon'] as String,
      types: (json['types'] as List<dynamic>)
          .map((e) => DetailService.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TypeServiceToJson(TypeService instance) =>
    <String, dynamic>{
      'title': instance.title,
      'isCountable': instance.isCountable,
      'rule': instance.rule,
      'icon': instance.icon,
      'types': instance.types,
    };
