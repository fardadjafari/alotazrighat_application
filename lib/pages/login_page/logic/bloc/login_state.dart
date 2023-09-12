part of 'login_bloc.dart';

class LoginUserState {
  final LoginUserEvent loginUserEvent;

  LoginUserState({required this.loginUserEvent});

  LoginUserState copyWith(LoginUserEvent? loginUserEvent) {
    return LoginUserState(loginUserEvent: loginUserEvent ?? this.loginUserEvent);
  }
}
