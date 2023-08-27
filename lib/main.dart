import 'package:alotazrighat_application/pages/welcom_page/logic/bloc/welcom_bloc.dart';
import 'package:alotazrighat_application/pages/welcom_page/welcom_page.dart';
import 'package:alotazrighat_application/repository/services/user_services.dart';
import 'package:alotazrighat_application/repository/user_repository.dart';
import 'package:alotazrighat_application/themes/theme.dart';
import 'package:alotazrighat_application/tools/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  runApp(MultiBlocProvider(
    providers: [
      RepositoryProvider(
        create: (context) => UserRepository(userService: UserService()),
        child: BlocProvider(
          create: (context) =>
              WelcomBloc(userRepository: context.read<UserRepository>()),
        ),
      )
    ],
    child: CustomerApp(appRouter: AppRouter()),
  ));
}

class CustomerApp extends StatelessWidget {
  const CustomerApp({super.key, required this.appRouter});
  final AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        title: "Nurseino",
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('fa'), // English
        ],
        debugShowCheckedModeBanner: false,
        theme: CustomTheme.lightTheme,
        home: const Directionality(
            textDirection: TextDirection.rtl, child: WelcomPage()),
        onGenerateRoute: appRouter.onGenerateRout,
        initialRoute: WelcomPage.screenId,
      ),
    );
  }
}
