// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_decoder.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginDecoder _$LoginDecoderFromJson(Map<String, dynamic> json) => LoginDecoder(
      userFullName: json['userFullName'] as String,
      avatar: json['avatar'] as String,
      role: json['role'] as String,
      token: json['token'] as String,
    );

Map<String, dynamic> _$LoginDecoderToJson(LoginDecoder instance) =>
    <String, dynamic>{
      'token': instance.token,
      'userFullName': instance.userFullName,
      'avatar': instance.avatar,
      'role': instance.role,
    };
