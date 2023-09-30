part of 'active_bloc.dart';

abstract class ActiveEvent {}

class InitialActivePageEvent extends ActiveEvent {}

class LoadDataEvent extends ActiveEvent {}

class LoadingPageEvent extends ActiveEvent {}

class LoadActivePageEvent extends ActiveEvent {
  final List<ActiveRequest> activeRequests;
  final String headerToken;

  LoadActivePageEvent(
      {required this.activeRequests, required this.headerToken});
}

class RejectRequestEvent extends ActiveEvent {
  final String uniqCode;

  RejectRequestEvent({required this.uniqCode});
}

class CompletedRejectEvent extends ActiveEvent {}

class FaildRejectEvent extends ActiveEvent {}

class FinishRequestEvent extends ActiveEvent {
  final FinishedNurse finishNurse;

  FinishRequestEvent({required this.finishNurse});
}

class ComletedFinishEvent extends ActiveEvent {}

class FaildfinishEvent extends ActiveEvent {}
