part of 'welcom_bloc.dart';

class WelcomState {
  final WelcomEvent welcomEvent;

  WelcomState({required this.welcomEvent});

  WelcomState copyWith(WelcomEvent? welcomEvent) {
    return WelcomState(welcomEvent: welcomEvent ?? this.welcomEvent);
  }
}
