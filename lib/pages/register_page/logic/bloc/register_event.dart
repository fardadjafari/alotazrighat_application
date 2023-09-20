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

class InitialMapPageEvent extends RegisterEvent {
  final double lang;
  final double laut;

  InitialMapPageEvent({required this.lang, required this.laut});
}
