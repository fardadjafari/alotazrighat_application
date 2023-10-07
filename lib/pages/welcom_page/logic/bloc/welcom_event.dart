part of 'welcom_bloc.dart';

abstract class WelcomEvent {}

class InitialWelcomEvent extends WelcomEvent {}

class TestConectionWelcomEvent extends WelcomEvent {}

class FirstEnterEvent extends WelcomEvent {}

class LoginUserEvent extends WelcomEvent {}

class LogeOutEvent extends WelcomEvent {}

class CompletedWelcomEvent extends WelcomEvent {}

class FeaildConectionWelcomEvent extends WelcomEvent {}
