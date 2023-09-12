// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_code.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendSmsCode _$SendSmsCodeFromJson(Map<String, dynamic> json) => SendSmsCode(
      userType: json['userType'] as String,
      phoneNumber: json['phoneNumber'] as String,
    );

Map<String, dynamic> _$SendSmsCodeToJson(SendSmsCode instance) =>
    <String, dynamic>{
      'phoneNumber': instance.phoneNumber,
      'userType': instance.userType,
    };
