part of 'send_bloc.dart';

abstract class SendEvent {}

class InitialSendPageEvent extends SendEvent {}

class LoadDataEvent extends SendEvent {
  final String uniqueCode;

  final List<AllCities>? allCities;

  final TypeService? typeService;

  LoadDataEvent(
      {required this.uniqueCode,
      required this.allCities,
      required this.typeService});
}

class LoadAreaEvent extends SendEvent {
  final String cityId;

  LoadAreaEvent({required this.cityId});
}

class CompletedAreaEvent extends SendEvent {
  final List<AllAreas> allAreas;

  CompletedAreaEvent({required this.allAreas});
}

class InitialDicountPage extends SendEvent {}

class LoadningPage extends SendEvent {}

class LoadDicountPage extends SendEvent {}

class AppliedDiscount extends SendEvent {
  final String code;

  AppliedDiscount({required this.code});
}

class RejectDiscount extends SendEvent {}

class CheckPermisionEvent extends SendEvent {}

class InitialMapPageEvent extends SendEvent {
  final double lang;
  final double laut;

  InitialMapPageEvent({required this.lang, required this.laut});
}

class TurnOnGPSEvent extends SendEvent {}

class FaildPermisionEvent extends SendEvent {}

class AddRequestEvent extends SendEvent {
  final String sex;

  final String? nurseSex;

  final String address;

  final String areaId;

  final String serviceTypeId;

  final int quantity;

  final double lat;

  final double lang;

  final String discountCode;

  AddRequestEvent(this.lat, this.lang, this.discountCode,
      {required this.sex,
      required this.nurseSex,
      required this.address,
      required this.areaId,
      required this.serviceTypeId,
      required this.quantity});
}

class RedirectToPayEvent extends SendEvent {
  final String requestCode;

  RedirectToPayEvent({required this.requestCode});
}

class FailedRequestEvent extends SendEvent {}
