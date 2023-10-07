import 'package:alotazrighat_application/pages/home_page/widget/service_item.dart';
import 'package:alotazrighat_application/widget/color_utility.dart';
import 'package:alotazrighat_application/widget/loading/loading_widget.dart';
import 'package:alotazrighat_application/widget/media_query.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/home_bloc.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    context.read<HomeBloc>().add(InitialPageEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state.homeEvent is LoadServicePageEvent) {
          var listService = state.homeEvent as LoadServicePageEvent;
          return ListView.separated(
            itemCount: listService.serviceList.length,
            separatorBuilder: (context, index) => SizedBox(
              height: getHeight(context, 0.02),
            ),
            itemBuilder: (context, index) {
              return ServiceItem(
                  uniqueCode: listService.serviceList[index].uniqueCode,
                  title: listService.serviceList[index].title,
                  imagePath: listService.serviceList[index].icon);
            },
          );
        } else {
          return Center(
            child: LoadingWidget(
              size: getHeight(context, 0.00019),
              color: bgColor,
            ),
          );
        }
      },
    );
  }
}
