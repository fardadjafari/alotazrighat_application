import 'package:alotazrighat_application/pages/helph_page/helph_page.dart';
import 'package:alotazrighat_application/pages/layout_page.dart';
import 'package:alotazrighat_application/pages/login_page/login_page.dart';
import 'package:alotazrighat_application/pages/welcom_page/logic/bloc/welcom_bloc.dart';
import 'package:alotazrighat_application/pages/welcom_page/widget/load_widget.dart';
import 'package:alotazrighat_application/widget/popup/awesome_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<WelcomBloc, WelcomState>(
      listener: (context, state) {
        if (state.welcomEvent is FeaildConectionWelcomEvent) {
          alertDialogWarning(
            context,
            "مشکل",
            "خطا در اتصال به اینترنت",
            "تلاش مجدد",
            () {
              context.read<WelcomBloc>().add(InitialWelcomEvent());
            },
          );
        } else if (state.welcomEvent is FirstEnterEvent) {
          Future.delayed(const Duration(seconds: 7), () {
            Navigator.pushNamed(context, HelphPage.screenId);
          });
        } else if (state.welcomEvent is LoginUserEvent) {
          Future.delayed(const Duration(seconds: 7), () {
            Navigator.pushNamed(context, Layout.screenId);
          });
        } else if (state.welcomEvent is LogeOutEvent) {
          Future.delayed(const Duration(seconds: 7), () {
            Navigator.pushNamed(context, LoginPage.screenId);
          });
        }
      },
      child: const LoadWidget(),
    );
  }
}
