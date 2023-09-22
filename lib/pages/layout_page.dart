import 'dart:io';

import 'package:alotazrighat_application/pages/cubit/navigation_cubit.dart';
import 'package:alotazrighat_application/pages/main_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Layout extends StatelessWidget {
  const Layout({Key? key}) : super(key: key);
  static const String screenId = "/layout_page";

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: MultiBlocProvider(
        providers: [
          BlocProvider<NavigationCubit>(create: (context) => NavigationCubit()),
        ],
        child: const MainPage(),
      ),
      onWillPop: () => exit(0),
    );
  }
}
