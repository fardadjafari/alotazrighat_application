part of 'login_bloc.dart';

class LoginState {
  final LoginEvent loginEvent;

  const LoginState({required this.loginEvent});

  LoginState copyWith(LoginEvent? loginEvent) {
    return LoginState(loginEvent: loginEvent ?? this.loginEvent);
  }
}
