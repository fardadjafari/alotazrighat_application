import 'dart:async';

import 'package:alotazrighat_application/repository/user_repository.dart';
import 'package:alotazrighat_application/tools/network/http_status.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginUserEvent, LoginUserState> {
  LoginBloc({required this.userRepository})
      : super(LoginUserState(loginUserEvent: InitialPageEvent())) {
    on<InitialPageEvent>(_InitLoginPage);
    on<FillPhoneNumberEvent>(_sendCode);
    on<FillPasswordEvent>(_ckeckDataLogin);
  }
  final UserRepository userRepository;

  FutureOr<void> _sendCode(
      FillPhoneNumberEvent event, Emitter<LoginUserState> emit) async {
    emit(state.copyWith(LoadingPageEvent()));

    var result = await userRepository.sendSMSCode(event.phonenumber);

    if (result.statusHttps == StatusHttps.ok) {
      emit(state.copyWith(InitialPasswordPageEvent()));
    } else {
      emit(state.copyWith(ErrorPhoneNumberEvent()));
      emit(state.copyWith(InitialPageEvent()));
    }
  }

  FutureOr<void> _ckeckDataLogin(
      FillPasswordEvent event, Emitter<LoginUserState> emit) async {
    emit(state.copyWith(LoadingPageEvent()));

    var result =
        await userRepository.loginUser(event.phonenumber, event.password);

    if (result.statusHttps == StatusHttps.ok) {
      emit(state.copyWith(CompletedLoginEvent()));
    } else {
      emit(state.copyWith(ErrorPasswordEvent()));
      emit(state.copyWith(InitialPasswordPageEvent()));
    }
  }

  FutureOr<void> _InitLoginPage(
      InitialPageEvent event, Emitter<LoginUserState> emit) {
    emit(state.copyWith(LoadingPageEvent()));

    emit(state.copyWith(InitialPageEvent()));
  }
}
