part of 'register_bloc.dart';

class RegisterState {
  final RegisterEvent registerEvent;
  double? lang;
  double? laut;

  RegisterState({required this.registerEvent});

  RegisterState copyWith(RegisterEvent? registerEvent) {
    return RegisterState(registerEvent: registerEvent ?? this.registerEvent);
  }
}
