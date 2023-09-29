import 'package:alotazrighat_application/constants/constans_variable.dart';
import 'package:alotazrighat_application/pages/active_request/logic/bloc/active_bloc.dart';
import 'package:alotazrighat_application/pages/active_request/widget/item_request.dart';
import 'package:alotazrighat_application/repository/models/request/active_request_model.dart';
import 'package:alotazrighat_application/repository/models/request/enums/request_status.dart';
import 'package:alotazrighat_application/tools/digit/date_time.dart';
import 'package:alotazrighat_application/widget/color_utility.dart';
import 'package:alotazrighat_application/widget/lable/text_lable.dart';
import 'package:alotazrighat_application/widget/media_query.dart';
import 'package:alotazrighat_application/widget/popup/awesome_alert.dart';
import 'package:alotazrighat_application/widget/popup/awsome_image.dart';
import 'package:alotazrighat_application/widget/shapes/space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class ActiveRequestItem extends StatelessWidget {
  const ActiveRequestItem(
      {super.key, required this.activeRequestList, required this.header});
  final ActiveRequest activeRequestList;
  final String header;

  @override
  Widget build(BuildContext context) {
    if (activeRequestList.status == RequestStatus.Accept) {
      return Container(
          width: getAllWidth(context),
          child: Stack(
            children: <Widget>[
              Card(
                margin: const EdgeInsets.only(top: 20.0),
                color: bgColor,
                child: SizedBox(
                    height: getHeight(context, 0.6),
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 45.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          TextLable(
                              text: "پرستا شما",
                              colorText: buttonTextColor,
                              fontWeightText: FontWeight.bold,
                              fontSizeText: getWidth(context, 0.027),
                              textAlign: TextAlign.center),
                          TextLable(
                              text:
                                  "${activeRequestList.nurseFirstName} ${activeRequestList.nurseLastName}",
                              colorText: buttonTextColor,
                              fontWeightText: FontWeight.w500,
                              fontSizeText: getWidth(context, 0.038),
                              textAlign: TextAlign.center),
                          SizedBox(
                            height: getHeight(context, 0.02),
                          ),
                          ItemRequest(
                              title: "خدمت درخواستی",
                              value: activeRequestList.serviceTitle),
                          const Sperstor(
                            color: Colors.white,
                          ),
                          ItemRequest(
                              title: "تعداد",
                              value: activeRequestList.serviceQuantity
                                  .toString()
                                  .replaceAll(RegExp(r'([.]*0)(?!.*\d)'), '')),
                          const Sperstor(
                            color: Colors.white,
                          ),
                          ItemRequest(
                              title: "زمان ثبت",
                              value: ConvertDateTime.toShamsi(
                                  activeRequestList.createAt)),
                          const Sperstor(
                            color: Colors.white,
                          ),
                          ItemRequest(
                              title: "وضعیت",
                              value: RequestStatusExtensions.translateToFarsi(
                                  activeRequestList.status.index)),
                          const Sperstor(
                            color: Colors.white,
                          ),
                          ItemRequest(
                              title: "مبلغ پرداختی",
                              value: NumberFormat('###,###,000')
                                  .format(activeRequestList.finalPrice)),
                          const Sperstor(
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: getHeight(context, 0.03),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              FloatingActionButton(
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.blueAccent,
                                child:
                                    const Icon(Icons.medical_information_sharp),
                                onPressed: () {
                                  alertDialogImage(
                                      context,
                                      "کارت پرستاری",
                                      StaticVariable.nurseCard +
                                          activeRequestList.nurseLicenceCard,
                                      "دیدم",
                                      header);
                                },
                              ),
                              FloatingActionButton(
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.green,
                                child: const Icon(Icons.check_circle),
                                onPressed: () {},
                              ),
                              FloatingActionButton(
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.red,
                                child: const Icon(Icons.cancel),
                                onPressed: () {
                                  alertDialogWarning(
                                      context,
                                      "لغو درخواست",
                                      "آیا از لفو درخواست حود مطمئت هستید ؟",
                                      "لغو کن", () {
                                    context.read<ActiveBloc>().add(
                                        RejectRequestEvent(
                                            uniqCode:
                                                activeRequestList.requestCode));
                                  });
                                },
                              ),
                              FloatingActionButton(
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.blue,
                                child: const Icon(Icons.phone),
                                onPressed: () => launchUrl(Uri.parse(
                                    "tel:${activeRequestList.nursePhoneNumber}")),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )),
              ),
              Positioned(
                top: .0,
                left: .0,
                right: .0,
                child: Center(
                  child: CircleAvatar(
                    radius: 30.0,
                    backgroundImage: NetworkImage(StaticVariable.userAvatar +
                        activeRequestList.nurseAvatar!),
                  ),
                ),
              ),
            ],
          ));
    } else {
      return Container(
          width: getAllWidth(context),
          child: Stack(
            children: <Widget>[
              Card(
                margin: const EdgeInsets.only(top: 20.0),
                color: bgColor,
                child: SizedBox(
                    height: getHeight(context, 0.5),
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 45.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          ItemRequest(
                              title: "خدمت درخواستی",
                              value: activeRequestList.serviceTitle),
                          const Sperstor(
                            color: Colors.white,
                          ),
                          ItemRequest(
                              title: "تعداد",
                              value: activeRequestList.serviceQuantity
                                  .toString()
                                  .replaceAll(RegExp(r'([.]*0)(?!.*\d)'), '')),
                          const Sperstor(
                            color: Colors.white,
                          ),
                          ItemRequest(
                              title: "زمان ثبت",
                              value: ConvertDateTime.toShamsi(
                                  activeRequestList.createAt)),
                          const Sperstor(
                            color: Colors.white,
                          ),
                          ItemRequest(
                              title: "وضعیت",
                              value: RequestStatusExtensions.translateToFarsi(
                                  activeRequestList.status.index)),
                          const Sperstor(
                            color: Colors.white,
                          ),
                          ItemRequest(
                              title: "مبلغ پرداختی",
                              value: NumberFormat('###,###,000')
                                  .format(activeRequestList.finalPrice)),
                          const Sperstor(
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: getHeight(context, 0.03),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.red,
                                child: const Icon(Icons.cancel),
                                onPressed: () {},
                              ),
                            ],
                          )
                        ],
                      ),
                    )),
              ),
            ],
          ));
    }
  }
}
