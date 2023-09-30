import 'dart:async';

import 'package:alotazrighat_application/repository/models/request/active_request_model.dart';
import 'package:alotazrighat_application/repository/models/request/finished_request.dart';
import 'package:alotazrighat_application/repository/request_repository.dart';
import 'package:alotazrighat_application/tools/network/http_status.dart';
import 'package:bloc/bloc.dart';

part 'active_event.dart';
part 'active_state.dart';

class ActiveBloc extends Bloc<ActiveEvent, ActiveState> {
  ActiveBloc({required this.requestRepository})
      : super(ActiveState(activeEvent: InitialActivePageEvent())) {
    on<InitialActivePageEvent>(_initPage);
    on<RejectRequestEvent>(rejectRequest);
    on<FinishRequestEvent>(finishRequest);
  }
  final RequestRepository requestRepository;

  FutureOr<void> _initPage(
      InitialActivePageEvent event, Emitter<ActiveState> emit) async {
    emit(state.copyWith(InitialActivePageEvent()));

    emit(state.copyWith(LoadingPageEvent()));

    var activeRequest = await requestRepository.getActiveRequest();

    var header = await requestRepository.getHeader();

    emit(state.copyWith(LoadActivePageEvent(
        headerToken: header,
        activeRequests: activeRequest.data as List<ActiveRequest>)));
  }

  FutureOr<void> rejectRequest(
      RejectRequestEvent event, Emitter<ActiveState> emit) async {
    var result = await requestRepository.rejectNurse(event.uniqCode);

    if (result.statusHttps == StatusHttps.ok) {
      emit(state.copyWith(CompletedRejectEvent()));
    }

    emit(state.copyWith(FaildRejectEvent()));
  }

  FutureOr<void> finishRequest(
      FinishRequestEvent event, Emitter<ActiveState> emit) async {
    var result = await requestRepository.finishedRequest(event.finishNurse);

    if (result.statusHttps == StatusHttps.ok) {
      emit(state.copyWith(ComletedFinishEvent()));
    }

    emit(state.copyWith(FaildfinishEvent()));
  }
}
