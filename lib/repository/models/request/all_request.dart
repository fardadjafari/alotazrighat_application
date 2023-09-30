import 'package:alotazrighat_application/repository/models/request/result_request_list.dart';
import 'package:alotazrighat_application/repository/models/request/search_request.dart';
import 'package:json_annotation/json_annotation.dart';

part 'all_request.g.dart';

@JsonSerializable(fieldRename: FieldRename.none)
class AllRequest {
  final int currentPage;

  final int pageCount;

  final int pageSize;

  final List<ResultRequst> result;

  final SearchRequest searchParameters;

  factory AllRequest.fromJson(Map<String, dynamic> json) =>
      _$AllRequestFromJson(json);

  AllRequest(
      {required this.currentPage,
      required this.pageCount,
      required this.pageSize,
      required this.result,
      required this.searchParameters});
}
