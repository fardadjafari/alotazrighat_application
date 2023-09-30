// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllRequest _$AllRequestFromJson(Map<String, dynamic> json) => AllRequest(
      currentPage: json['currentPage'] as int,
      pageCount: json['pageCount'] as int,
      pageSize: json['pageSize'] as int,
      result: (json['result'] as List<dynamic>)
          .map((e) => ResultRequst.fromJson(e as Map<String, dynamic>))
          .toList(),
      searchParameters: SearchRequest.fromJson(
          json['searchParameters'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AllRequestToJson(AllRequest instance) =>
    <String, dynamic>{
      'currentPage': instance.currentPage,
      'pageCount': instance.pageCount,
      'pageSize': instance.pageSize,
      'result': instance.result,
      'searchParameters': instance.searchParameters,
    };
