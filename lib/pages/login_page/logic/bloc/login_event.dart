part of 'login_bloc.dart';

@immutable
abstract class LoginUserEvent {}

class InitialPageEvent extends LoginUserEvent {}

class InitialPasswordPageEvent extends LoginUserEvent {}

class LoadingPageEvent extends LoginUserEvent {}

class FillPhoneNumberEvent extends LoginUserEvent {
  final String phonenumber;

  FillPhoneNumberEvent({required this.phonenumber});
}

class ErrorPhoneNumberEvent extends LoginUserEvent {}

class FillPasswordEvent extends LoginUserEvent {
  final String phonenumber;
  final String password;

  FillPasswordEvent({required this.phonenumber, required this.password});
}

class ErrorPasswordEvent extends LoginUserEvent {}

class CompletedLoginEvent extends LoginUserEvent {}
