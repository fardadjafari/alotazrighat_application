// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailService _$DetailServiceFromJson(Map<String, dynamic> json) =>
    DetailService(
      id: json['id'] as String,
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
    );

Map<String, dynamic> _$DetailServiceToJson(DetailService instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
    };
