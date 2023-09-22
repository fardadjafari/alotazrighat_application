import 'package:alotazrighat_application/constants/constans_variable.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationState(NavbarItem.home, 0));

  void getNavBarItem(NavbarItem navbarItem) {
    switch (navbarItem) {
      case NavbarItem.home:
        emit(NavigationState(NavbarItem.home, 0));
        break;
      case NavbarItem.request:
        emit(NavigationState(NavbarItem.request, 1));
        break;
      case NavbarItem.activeRequest:
        emit(NavigationState(NavbarItem.activeRequest, 2));
        break;
    }
  }
}
