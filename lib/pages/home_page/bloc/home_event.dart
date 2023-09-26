part of 'home_bloc.dart';

abstract class HomeEvent {}

class InitialPageEvent extends HomeEvent {}

class LoadingPageEvent extends HomeEvent {}

class LoadServicePageEvent extends HomeEvent {
  final List<ServiceItem> serviceList;

  LoadServicePageEvent({required this.serviceList});
}
