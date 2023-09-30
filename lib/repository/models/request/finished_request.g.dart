// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'finished_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FinishedNurse _$FinishedNurseFromJson(Map<String, dynamic> json) =>
    FinishedNurse(
      requestCode: json['requestCode'] as String,
      rate: json['rate'] as String,
      feelingDescription: json['feelingDescription'] as String?,
    );

Map<String, dynamic> _$FinishedNurseToJson(FinishedNurse instance) =>
    <String, dynamic>{
      'requestCode': instance.requestCode,
      'rate': instance.rate,
      'feelingDescription': instance.feelingDescription,
    };
