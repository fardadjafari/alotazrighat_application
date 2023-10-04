import 'package:alotazrighat_application/pages/send_page/logic/bloc/send_bloc.dart';
import 'package:alotazrighat_application/repository/request_repository.dart';
import 'package:alotazrighat_application/repository/services/request_service.dart';
import 'package:alotazrighat_application/widget/media_query.dart';
import 'package:alotazrighat_application/widget/shapes/wave_shape.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widget/body.dart';

class SendPage extends StatelessWidget {
  const SendPage({super.key, required this.uniqCode});
  static const String screenId = "/service_page";
  final String uniqCode;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => RequestRepository(requestService: RequestService()),
      child: BlocProvider(
        create: (context) =>
            SendBloc(requestRepository: context.read<RequestRepository>()),
        child: Scaffold(
          body: Stack(children: [
            FadeInDown(
              child: Center(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: WaveWidget(heightWave: getHeight(context, 0.0003)),
                ),
              ),
            ),
            Body(uniqCode: uniqCode),
          ]),
        ),
      ),
    );
  }
}
