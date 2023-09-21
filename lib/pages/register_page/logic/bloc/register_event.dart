part of 'register_bloc.dart';

@immutable
abstract class RegisterEvent {}

class LoadingPageEvent extends RegisterEvent {}

class InitialRegisterPageEvent extends RegisterEvent {}

class TurnOnGPSEvent extends RegisterEvent {}

class FaildPermisionEvent extends RegisterEvent {}

class FillFormPageEvent extends RegisterEvent {
  final String firstName;

  final String lastName;

  final String phoneNumber;

  final String telephone;

  final String address;

  FillFormPageEvent(
      {required this.firstName,
      required this.lastName,
      required this.phoneNumber,
      required this.telephone,
      required this.address});
}

class ErrorFormPageEvent extends RegisterEvent {
  final String errorMessage;

  ErrorFormPageEvent({required this.errorMessage});
}

class CompletFormPageEvent extends RegisterEvent {
  final String firstName;

  final String lastName;

  final String phoneNumber;

  final String telephone;

  final String address;

  final double lang;

  final double laut;

  CompletFormPageEvent(
      {required this.firstName,
      required this.lastName,
      required this.phoneNumber,
      required this.telephone,
      required this.address,
      required this.lang,
      required this.laut});
}

class CompletedRegisterEvent extends RegisterEvent {}

class InitialPasswordPageEvent extends RegisterEvent {}

class FillPasswordEvent extends RegisterEvent {
  final String phonenumber;
  final String password;

  FillPasswordEvent({required this.phonenumber, required this.password});
}

class ErrorPasswordEvent extends RegisterEvent {}

class InitialMapPageEvent extends RegisterEvent {
  final double lang;
  final double laut;

  InitialMapPageEvent({required this.lang, required this.laut});
}

class FinishedLoginEvent extends RegisterEvent {}
