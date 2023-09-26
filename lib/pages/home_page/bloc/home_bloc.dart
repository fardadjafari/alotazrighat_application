import 'dart:async';
import 'package:alotazrighat_application/repository/models/service/service_item.dart';
import 'package:alotazrighat_application/repository/models/service/service_list.dart';
import 'package:alotazrighat_application/repository/request_repository.dart';
import 'package:bloc/bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({required this.requestRepository})
      : super(HomeState(homeEvent: InitialPageEvent())) {
    on<InitialPageEvent>(_initPage);
  }
  final RequestRepository requestRepository;

  FutureOr<void> _initPage(
      InitialPageEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(InitialPageEvent()));

    emit(state.copyWith(LoadingPageEvent()));

    var serviceModel = await requestRepository.getMainService();

    emit(state.copyWith(LoadServicePageEvent(
        serviceList: serviceModel.data as List<ServiceItem>)));
  }
}
