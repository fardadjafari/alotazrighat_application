import 'package:alotazrighat_application/pages/login_page/logic/bloc/login_bloc.dart';
import 'package:alotazrighat_application/pages/register_page/logic/bloc/register_bloc.dart';
import 'package:alotazrighat_application/pages/welcom_page/logic/bloc/welcom_bloc.dart';
import 'package:alotazrighat_application/pages/welcom_page/welcom_page.dart';
import 'package:alotazrighat_application/repository/models/setting/profile_table.dart';
import 'package:alotazrighat_application/repository/services/user_services.dart';
import 'package:alotazrighat_application/repository/user_repository.dart';
import 'package:alotazrighat_application/themes/theme.dart';
import 'package:alotazrighat_application/tools/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(ProfileModelAdapter());
  runApp(RepositoryProvider(
    create: (context) => UserRepository(userService: UserService()),
    child: MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              WelcomBloc(userRepository: context.read<UserRepository>())
                ..add(InitialWelcomEvent()),
        ),
        BlocProvider(
          create: (context) =>
              LoginBloc(userRepository: context.read<UserRepository>()),
        ),
        BlocProvider(
          create: (context) =>
              RegisterBloc(userRepository: context.read<UserRepository>())
                ..add(InitialRegisterPageEvent()),
        ),
      ],
      child: CustomerApp(appRouter: AppRouter()),
    ),
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
        title: "A;otazrighat",
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
      ),
    );
  }
}
