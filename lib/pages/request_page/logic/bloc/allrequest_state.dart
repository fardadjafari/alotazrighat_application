part of 'allrequest_bloc.dart';

class AllRequestState {
  final AllRequestEvent allRequestEvent;

  AllRequestState({required this.allRequestEvent});

  AllRequestState copyWith(AllRequestEvent? allRequestEvent) {
    return AllRequestState(
        allRequestEvent: allRequestEvent ?? this.allRequestEvent);
  }
}
