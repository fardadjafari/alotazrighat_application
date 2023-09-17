part of 'register_bloc.dart';

@immutable
abstract class RegisterEvent {}

class LoadingPageEvent extends RegisterEvent {}

class InitialRegisterPageEvent extends RegisterEvent {}

class TurnOnGPSEvent extends RegisterEvent {}

class FaildPermisionEvent extends RegisterEvent {}

class InitialFormPageEvent extends RegisterEvent {}

class InitialMapPageEvent extends RegisterEvent {}
