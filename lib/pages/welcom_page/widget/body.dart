import 'package:alotazrighat_application/pages/welcom_page/logic/bloc/welcom_bloc.dart';
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
    return BlocBuilder<WelcomBloc, WelcomState>(
      builder: (context, state) {
        if (state.welcomEvent is InitialWelcomEvent) {
          return Container(
            color: Colors.red,
          );
        }
        if (state.welcomEvent is TestConectionWelcomEvent) {
          return Container(color: Colors.amber);
        }
        if (state.welcomEvent is CompletedWelcomEvent) {}

        return Container(
          color: Colors.black,
        );
      },
    );
  }
}
