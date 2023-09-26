import 'package:alotazrighat_application/repository/services/request_service.dart';
import 'package:alotazrighat_application/tools/network/http_status.dart';

class RequestRepository {
  final RequestService requestService;

  RequestRepository({required this.requestService});

  Future<OperationResult> getMainService() => requestService.getMainService();
}
