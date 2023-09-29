part of 'active_bloc.dart';

class ActiveState {
  final ActiveEvent activeEvent;

  ActiveState({required this.activeEvent});

  ActiveState copyWith(ActiveEvent? activeEvent) {
    return ActiveState(activeEvent: activeEvent ?? this.activeEvent);
  }
}
