part of 'send_bloc.dart';

class SendState {
  final SendEvent sendEvent;

  SendState({required this.sendEvent});

  SendState copyWith(SendEvent? sendEvent) {
    return SendState(sendEvent: sendEvent ?? this.sendEvent);
  }
}
