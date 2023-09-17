import 'dart:async';

import 'package:alotazrighat_application/repository/user_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final UserRepository userRepository;
  late double? lang;
  late double? laut;

  RegisterBloc({required this.userRepository})
      : super(RegisterState(registerEvent: InitialRegisterPageEvent())) {
    on<InitialRegisterPageEvent>(_checkPermision);
  }

  FutureOr<void> _checkPermision(
      InitialRegisterPageEvent event, Emitter<RegisterState> emit) async {
    emit(state.copyWith(LoadingPageEvent()));

    bool servicestatus = await Geolocator.isLocationServiceEnabled();

    if (!servicestatus) {
      emit(state.copyWith(TurnOnGPSEvent()));
    }

    LocationPermission permission = await Geolocator.checkPermission();

    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever ||
        permission == LocationPermission.denied) {
      emit(state.copyWith(FaildPermisionEvent()));
    }

    print(permission.toString());

    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      emit(state.copyWith(InitialFormPageEvent()));
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    lang = position.longitude;
    laut = position.latitude;
    print(position);

    if (position.latitude > 0) {
      emit(state.copyWith(InitialMapPageEvent()));
    }
  }
}
