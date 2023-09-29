import 'package:alotazrighat_application/repository/services/request_service.dart';
import 'package:alotazrighat_application/tools/network/http_status.dart';

class RequestRepository {
  final RequestService requestService;

  RequestRepository({required this.requestService});

  Future<OperationResult> getMainService() => requestService.getMainService();

  Future<OperationResult> getActiveRequest() =>
      requestService.getActiveRequest();

  Future<String> getHeader() => requestService.getHeaderToken();

  Future<OperationResult> rejectNurse(String code) =>
      requestService.rejectRequest(code);
}
