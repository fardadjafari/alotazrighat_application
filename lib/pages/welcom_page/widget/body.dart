import 'package:alotazrighat_application/pages/welcom_page/logic/bloc/welcom_bloc.dart';
import 'package:alotazrighat_application/pages/welcom_page/widget/load_widget.dart';
import 'package:alotazrighat_application/widget/popup/awesome_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  void initState() {
    context.read<WelcomBloc>().add(InitialWelcomEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<WelcomBloc, WelcomState>(
      listener: (context, state) {
        if (state.welcomEvent is FeaildConectionWelcomEvent) {
          alertDialogWarning(
            context,
            "مشکل",
            "خطا در اتصال به اینترنت",
            () {
              context.read<WelcomBloc>().add(InitialWelcomEvent());
            },
          );
        } else if (state.welcomEvent is CompletedWelcomEvent) {
          print("object");
        }
      },
      child: const LoadWidget(),
    );
  }
}
