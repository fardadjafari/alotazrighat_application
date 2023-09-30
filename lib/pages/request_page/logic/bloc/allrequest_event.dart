part of 'allrequest_bloc.dart';

abstract class AllRequestEvent {}

class InitialRequestPageEvent extends AllRequestEvent {}

class LoadingPageEvent extends AllRequestEvent {}

class LoadDataRequestEvent extends AllRequestEvent {
  final List<ResultRequst> requestModel;

  LoadDataRequestEvent({required this.requestModel});
}

class UpdateSearch extends AllRequestEvent {
  final RequestStatus statusRequest;

  UpdateSearch({required this.statusRequest});
}
