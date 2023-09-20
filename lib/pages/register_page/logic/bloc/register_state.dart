part of 'register_bloc.dart';

class RegisterState {
  final RegisterEvent registerEvent;

  RegisterState({required this.registerEvent});

  RegisterState copyWith(RegisterEvent? registerEvent) {
    return RegisterState(registerEvent: registerEvent ?? this.registerEvent);
  }
}
