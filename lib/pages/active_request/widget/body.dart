import 'package:alotazrighat_application/pages/active_request/logic/bloc/active_bloc.dart';
import 'package:alotazrighat_application/pages/active_request/widget/request_active.dart';
import 'package:alotazrighat_application/styles/radius.dart';
import 'package:alotazrighat_application/widget/color_utility.dart';
import 'package:alotazrighat_application/widget/lable/text_lable.dart';
import 'package:alotazrighat_application/widget/loading/loading_widget.dart';
import 'package:alotazrighat_application/widget/media_query.dart';
import 'package:alotazrighat_application/widget/popup/awesome_alert.dart';
import 'package:alotazrighat_application/widget/popup/snack_bar_widget.dart';
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
    context.read<ActiveBloc>().add(InitialActivePageEvent());
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: getWidth(context, 0.17)),
      child: BlocConsumer<ActiveBloc, ActiveState>(
        listener: (context, state) {
          if (state.activeEvent is CompletedRejectEvent) {
            alertDialogWarning(
                context,
                "لغو درخواست",
                "درخواست شما لغو شد منتظر تماس کارشناسان جهت اودت هزینه باشید",
                "لغو کن", () {
              context.read<ActiveBloc>().add(InitialActivePageEvent());
            });
          }

          if (state.activeEvent is FaildRejectEvent) {
            getSnackBarWidget(context, "درخواست شما لغو شد", Colors.red);
            context.read<ActiveBloc>().add(InitialActivePageEvent());
          }

          if (state.activeEvent is ComletedFinishEvent) {
            context.read<ActiveBloc>().add(InitialActivePageEvent());
          }

          if (state.activeEvent is FaildRejectEvent) {
            context.read<ActiveBloc>().add(InitialActivePageEvent());
          }
        },
        builder: (context, state) {
          if (state.activeEvent is LoadActivePageEvent) {
            var listRequest = state.activeEvent as LoadActivePageEvent;
            if (listRequest.activeRequests.isEmpty) {
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
              itemCount: listRequest.activeRequests.length,
              separatorBuilder: (context, index) => SizedBox(
                height: getHeight(context, 0.02),
              ),
              itemBuilder: (context, index) {
                return ActiveRequestItem(
                  activeRequestList: listRequest.activeRequests[index],
                  header: listRequest.headerToken,
                );
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
      ),
    );
  }
}
