import 'dart:async';
import 'package:alotazrighat_application/repository/models/area/all_areas.dart';
import 'package:alotazrighat_application/repository/models/area/all_cities.dart';
import 'package:alotazrighat_application/repository/models/auth/location.dart';
import 'package:alotazrighat_application/repository/models/request/add_request.dart';
import 'package:alotazrighat_application/repository/models/request/discount_request.dart';
import 'package:alotazrighat_application/repository/models/request/response_request.dart';
import 'package:alotazrighat_application/repository/models/request/type_service.dart';
import 'package:alotazrighat_application/repository/request_repository.dart';
import 'package:alotazrighat_application/tools/network/http_status.dart';
import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';

part 'send_event.dart';
part 'send_state.dart';

class SendBloc extends Bloc<SendEvent, SendState> {
  SendBloc({required this.requestRepository})
      : super(SendState(sendEvent: InitialSendPageEvent())) {
    on<InitialSendPageEvent>(_initPage);
    on<LoadDataEvent>(_loadData);
    on<LoadAreaEvent>(_loadArea);
    on<InitialDicountPage>(_loadDiscount);
    on<AppliedDiscount>(_applatDiscount);
    on<AddRequestEvent>(_addRequest);
    on<CheckPermisionEvent>(_ckeckPermision);
  }
  final RequestRepository requestRepository;

  FutureOr<void> _initPage(
      InitialSendPageEvent event, Emitter<SendState> emit) async {
    emit(state.copyWith(InitialSendPageEvent()));
  }

  FutureOr<void> _loadData(LoadDataEvent event, Emitter<SendState> emit) async {
    var cities = await requestRepository.getcities();

    var serviceDetail =
        await requestRepository.getDetailService(event.uniqueCode);

    emit(state.copyWith(LoadDataEvent(
        uniqueCode: event.uniqueCode,
        allCities: cities.data as List<AllCities>,
        typeService: serviceDetail.data as TypeService)));
  }

  FutureOr<void> _loadArea(LoadAreaEvent event, Emitter<SendState> emit) async {
    var result = await requestRepository.getArea(event.cityId);

    emit(state
        .copyWith(CompletedAreaEvent(allAreas: result.data as List<AllAreas>)));
  }

  FutureOr<void> _loadDiscount(
      InitialDicountPage event, Emitter<SendState> emit) async {
    emit(state.copyWith(LoadDicountPage()));
  }

  FutureOr<void> _applatDiscount(
      AppliedDiscount event, Emitter<SendState> emit) async {
    emit(state.copyWith(LoadningPage()));
    if (event.code.isNotEmpty) {
      var response = await requestRepository
          .checkDiscount(DiscountCheckModel(code: event.code));

      if (response.statusHttps == StatusHttps.ok) {
        emit(state.copyWith(CheckPermisionEvent()));
      }
      emit(state.copyWith(RejectDiscount()));
    } else {
      emit(state.copyWith(CheckPermisionEvent()));
    }
  }

  FutureOr<void> _addRequest(
      AddRequestEvent event, Emitter<SendState> emit) async {
    emit(state.copyWith(LoadningPage()));
    var result = await requestRepository.addRequest(AddRequest(
      location: Location(latitude: event.lat, longitude: event.lang),
      address: event.address,
      areaId: event.areaId,
      discountCode: event.discountCode,
      nurseSex: event.nurseSex,
      quantity: event.quantity,
      serviceTypeId: event.serviceTypeId,
      sex: event.sex,
    ));

    if (result.statusHttps == StatusHttps.ok) {
      var resultFinal = result.data as ResponseRequest;
      emit(state
          .copyWith(RedirectToPayEvent(requestCode: resultFinal.requestCode)));
    } else {
      emit(state.copyWith(FailedRequestEvent()));
    }
  }

  FutureOr<void> _ckeckPermision(
      CheckPermisionEvent event, Emitter<SendState> emit) async {
    bool servicestatus = await Geolocator.isLocationServiceEnabled();

    if (!servicestatus) {
      emit(state.copyWith(TurnOnGPSEvent()));
    }

    LocationPermission permission = await Geolocator.checkPermission();

    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever ||
        permission == LocationPermission.denied) {
      emit(state.copyWith(FaildPermisionEvent()));
    }

    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      // emit(state.copyWith(InitialFormPageEvent()));
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    emit(state.copyWith(InitialMapPageEvent(
        lang: position.longitude, laut: position.latitude)));
  }
}
