import 'dart:async';
import 'package:alotazrighat_application/repository/user_repository.dart';
import 'package:bloc/bloc.dart';

part 'welcom_event.dart';
part 'welcom_state.dart';

class WelcomBloc extends Bloc<WelcomEvent, WelcomState> {
  WelcomBloc({required this.userRepository})
      : super(WelcomState(welcomEvent: InitialWelcomEvent())) {
    on<TestConectionWelcomEvent>(_testContection);
  }
  final UserRepository userRepository;

  FutureOr<void> _testContection(
      TestConectionWelcomEvent event, Emitter<WelcomState> emit) async {
    emit(state.copyWith(TestConectionWelcomEvent()));

    var result = await userRepository.testServer();

    if (result) {
      emit(state.copyWith(CompletedWelcomEvent()));
    } else {
      emit(state.copyWith(FeaildConectionWelcomEvent()));
    }
  }
}
