import 'dart:async';

import 'package:alotazrighat_application/repository/models/request/enums/request_status.dart';
import 'package:alotazrighat_application/repository/models/request/result_request_list.dart';
import 'package:alotazrighat_application/repository/request_repository.dart';
import 'package:bloc/bloc.dart';

part 'allrequest_event.dart';
part 'allrequest_state.dart';

class AllrequestBloc extends Bloc<AllRequestEvent, AllRequestState> {
  AllrequestBloc({required this.requestRepository})
      : super(AllRequestState(allRequestEvent: InitialRequestPageEvent())) {
    on<InitialRequestPageEvent>(_init);
  }
  final RequestRepository requestRepository;

  FutureOr<void> _init(
      InitialRequestPageEvent event, Emitter<AllRequestState> emit) async {
    emit(state.copyWith(InitialRequestPageEvent()));

    emit(state.copyWith(LoadingPageEvent()));

    var requestList = await requestRepository.getAllRequest();

    emit(state.copyWith(LoadDataRequestEvent(
        requestModel: requestList.data as List<ResultRequst>)));
  }
}
