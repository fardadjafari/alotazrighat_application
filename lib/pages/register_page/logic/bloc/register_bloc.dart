import 'dart:async';
import 'package:alotazrighat_application/repository/models/auth/location.dart';
import 'package:alotazrighat_application/repository/models/auth/register_user.dart';
import 'package:alotazrighat_application/repository/user_repository.dart';
import 'package:alotazrighat_application/tools/network/http_status.dart';
import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final UserRepository userRepository;

  RegisterBloc({required this.userRepository})
      : super(RegisterState(registerEvent: InitialRegisterPageEvent())) {
    on<FillFormPageEvent>(_registerUser);
    on<FillPasswordEvent>(_loginUser);
    on<CompletFormPageEvent>(_completedRegister);
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
      // emit(state.copyWith(InitialFormPageEvent()));
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    emit(state.copyWith(InitialMapPageEvent(
        lang: position.longitude, laut: position.latitude)));
  }

  Future<void> _registerUser(
      FillFormPageEvent event, Emitter<RegisterState> emit) async {
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

    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      // emit(state.copyWith(InitialFormPageEvent()));
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    emit(state.copyWith(InitialMapPageEvent(
        lang: position.longitude, laut: position.latitude)));
  }

  FutureOr<void> _completedRegister(
      CompletFormPageEvent event, Emitter<RegisterState> emit) async {
    emit(state.copyWith(LoadingPageEvent()));

    var result = await userRepository.registerUser(RegisterUser(
        firstName: event.firstName,
        lastName: event.lastName,
        phoneNumber: event.phoneNumber,
        telephone: event.telephone,
        address: event.address,
        location: Location(latitude: event.laut, longitude: event.lang)));

    if (result.statusHttps == StatusHttps.ok) {
      var result = await userRepository.sendSMSCode(event.phoneNumber);

      if (result.statusHttps == StatusHttps.ok) {
        emit(state.copyWith(InitialPasswordPageEvent()));
      } else {
        emit(state
            .copyWith(ErrorFormPageEvent(errorMessage: "خطایی پیش آماده است")));
      }
    } else {
      emit(state.copyWith(ErrorFormPageEvent(
          errorMessage: result.message ?? "خطایی رخ داده است")));
      emit(state.copyWith(InitialRegisterPageEvent()));
    }
  }

  FutureOr<void> _loginUser(
      FillPasswordEvent event, Emitter<RegisterState> emit) async {
    emit(state.copyWith(LoadingPageEvent()));

    var result =
        await userRepository.loginUser(event.phonenumber, event.password);

    if (result.statusHttps == StatusHttps.ok) {
      emit(state.copyWith(FinishedLoginEvent()));
    } else {
      emit(state.copyWith(ErrorPasswordEvent()));
      emit(state.copyWith(InitialPasswordPageEvent()));
    }
  }
}
