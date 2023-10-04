import 'package:alotazrighat_application/pages/request_page/logic/bloc/allrequest_bloc.dart';
import 'package:alotazrighat_application/styles/radius.dart';
import 'package:alotazrighat_application/widget/color_utility.dart';
import 'package:alotazrighat_application/widget/lable/text_lable.dart';
import 'package:alotazrighat_application/widget/loading/loading_widget.dart';
import 'package:alotazrighat_application/widget/media_query.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'request_all.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  void initState() {
    context.read<AllrequestBloc>().add(InitialRequestPageEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: getHeight(context, 0.02)),
      child: BlocBuilder<AllrequestBloc, AllRequestState>(
        builder: (context, state) {
          if (state.allRequestEvent is LoadDataRequestEvent) {
            var listRequest = state.allRequestEvent as LoadDataRequestEvent;
            if (listRequest.requestModel.isEmpty) {
              return Center(
                child: ClipRRect(
                  borderRadius: getBorderRadiusWidget(29),
                  child: Container(
                    height: getHeight(context, 0.06),
                    color: bgColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextLable(
                            text: "  درخواستی وجود ندارد  ",
                            colorText: Colors.white,
                            fontWeightText: FontWeight.w500,
                            fontSizeText: getWidth(context, 0.05),
                            textAlign: TextAlign.center),
                        Padding(
                          padding:
                              EdgeInsets.only(right: getWidth(context, 0.02)),
                          child: Icon(
                            Icons.cancel,
                            color: Colors.white,
                            size: getWidth(context, 0.08),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }
            return ListView.separated(
              itemCount: listRequest.requestModel.length,
              separatorBuilder: (context, index) => SizedBox(
                height: getHeight(context, 0.02),
              ),
              itemBuilder: (context, index) {
                return RequestAllItem(
                  resultItem: listRequest.requestModel[index],
                );
              },
            );
          }
          return LoadingWidget(size: getWidth(context, 0.0005), color: bgColor);
        },
      ),
    );
  }
}
