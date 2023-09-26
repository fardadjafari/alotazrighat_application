import 'dart:io';

import 'package:alotazrighat_application/pages/cubit/navigation_cubit.dart';
import 'package:alotazrighat_application/pages/home_page/bloc/home_bloc.dart';
import 'package:alotazrighat_application/pages/main_page.dart';
import 'package:alotazrighat_application/repository/request_repository.dart';
import 'package:alotazrighat_application/repository/services/request_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Layout extends StatelessWidget {
  const Layout({Key? key}) : super(key: key);
  static const String screenId = "/layout_page";

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: MultiRepositoryProvider(
        providers: [
          RepositoryProvider<RequestRepository>(
              create: (context) =>
                  RequestRepository(requestService: RequestService())),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider<NavigationCubit>(
                create: (context) => NavigationCubit()),
            BlocProvider(
              create: (context) => HomeBloc(
                  requestRepository: context.read<RequestRepository>()),
            )
          ],
          child: const MainPage(),
        ),
      ),
      onWillPop: () => exit(0),
    );
  }
}
