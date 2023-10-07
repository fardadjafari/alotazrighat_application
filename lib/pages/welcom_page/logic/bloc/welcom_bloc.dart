import 'dart:async';
import 'package:alotazrighat_application/repository/database/hive_table.dart';
import 'package:alotazrighat_application/repository/models/setting/profile_table.dart';
import 'package:alotazrighat_application/repository/user_repository.dart';
import 'package:alotazrighat_application/tools/network/http_status.dart';
// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';

part 'welcom_event.dart';
part 'welcom_state.dart';

class WelcomBloc extends Bloc<WelcomEvent, WelcomState> {
  WelcomBloc({required this.userRepository})
      : super(WelcomState(welcomEvent: InitialWelcomEvent())) {
    on<InitialWelcomEvent>(_testContection);
  }
  final UserRepository userRepository;

  FutureOr<void> _testContection(
      InitialWelcomEvent event, Emitter<WelcomState> emit) async {
    var result = await userRepository.testServer();
    if (result) {
      await Hive.openBox<ProfileModel>('settingTable');
      final box = Hive.box<ProfileModel>(HiveTable.boxSetting);
      if (box.isNotEmpty) {
        var userInfo = box.getAt(0) as ProfileModel;
        var result = await userRepository.checkStatusUser(userInfo.token);
        if (result.statusHttps == StatusHttps.ok) {
          emit(state.copyWith(LoginUserEvent()));
        } else {
          emit(state.copyWith(LogeOutEvent()));
        }
      } else {
        emit(state.copyWith(FirstEnterEvent()));
      }
    } else {
      emit(state.copyWith(FeaildConectionWelcomEvent()));
    }
  }
}
