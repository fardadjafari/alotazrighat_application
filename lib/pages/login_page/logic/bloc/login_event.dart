part of 'login_bloc.dart';

class LoginEvent {}

class InitialPage extends LoginEvent {}

class LoadingPage extends LoginEvent {}

class EnterPhoneNumber extends LoginEvent {}

class ErrorPhoneNumber extends LoginEvent {}

class EnterPassword extends LoginEvent {
  final String phonenumber;

  EnterPassword({required this.phonenumber});
}

class ErrorPassword extends LoginEvent {}

sealed class CompletedLogin extends LoginEvent {
  final String phonenumber;
  final String password;

  CompletedLogin({required this.phonenumber, required this.password});
}
