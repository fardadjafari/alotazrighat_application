import 'package:alotazrighat_application/repository/models/request/enums/request_status.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_request.g.dart';

@JsonSerializable(fieldRename: FieldRename.none)
class SearchRequest {
  final int page;
  final String from;
  final String to;
  final RequestStatus status;

  factory SearchRequest.fromJson(Map<String, dynamic> json) =>
      _$SearchRequestFromJson(json);

  SearchRequest(
      {required this.page,
      required this.from,
      required this.to,
      required this.status});
}
