import 'package:alotazrighat_application/repository/models/request/add_request.dart';
import 'package:alotazrighat_application/repository/models/request/discount_request.dart';
import 'package:alotazrighat_application/repository/models/request/finished_request.dart';
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

  Future<OperationResult> finishedRequest(FinishedNurse finishedNurse) =>
      requestService.finishRequest(finishedNurse);

  Future<OperationResult> getAllRequest() => requestService.getAllRequest();

  Future<OperationResult> getcities() => requestService.getCity();

  Future<OperationResult> getArea(String cityId) =>
      requestService.getArea(cityId);

  Future<OperationResult> getDetailService(String uniqueCode) =>
      requestService.getTypeService(uniqueCode);

  Future<OperationResult> checkDiscount(
          DiscountCheckModel discountCheckModel) =>
      requestService.checkApplayDiscountCode(discountCheckModel);

  Future<OperationResult> addRequest(AddRequest addRequest) =>
      requestService.addRequest(addRequest);
}
