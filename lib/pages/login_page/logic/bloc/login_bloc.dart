import 'dart:async';

import 'package:bloc/bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState(loginEvent: InitialPage())) {
    on<LoginEvent>((event, emit) {
      on<LoginEvent>(_login);
    });
  }

  FutureOr<void> _login(LoginEvent event, Emitter<LoginState> emit) {
    emit(state.copyWith(LoadingPage()));

    if (condition) {
      
    }
  }
}
