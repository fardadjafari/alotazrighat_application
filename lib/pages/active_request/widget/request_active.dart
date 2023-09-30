import 'package:alotazrighat_application/constants/constans_variable.dart';
import 'package:alotazrighat_application/pages/active_request/logic/bloc/active_bloc.dart';
import 'package:alotazrighat_application/pages/active_request/widget/item_request.dart';
import 'package:alotazrighat_application/repository/enums/feelingRate.dart';
import 'package:alotazrighat_application/repository/models/request/active_request_model.dart';
import 'package:alotazrighat_application/repository/models/request/enums/request_status.dart';
import 'package:alotazrighat_application/repository/models/request/finished_request.dart';
import 'package:alotazrighat_application/tools/digit/date_time.dart';
import 'package:alotazrighat_application/tools/validator/user_validator.dart';
import 'package:alotazrighat_application/widget/button/squre_button.dart';
import 'package:alotazrighat_application/widget/color_utility.dart';
import 'package:alotazrighat_application/widget/input/multiline_input.dart';
import 'package:alotazrighat_application/widget/lable/text_lable.dart';
import 'package:alotazrighat_application/widget/media_query.dart';
import 'package:alotazrighat_application/widget/popup/awesome_alert.dart';
import 'package:alotazrighat_application/widget/popup/awesome_rating.dart';
import 'package:alotazrighat_application/widget/popup/awsome_image.dart';
import 'package:alotazrighat_application/widget/shapes/space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class ActiveRequestItem extends StatelessWidget {
  const ActiveRequestItem(
      {super.key, required this.activeRequestList, required this.header});
  final ActiveRequest activeRequestList;
  final String header;

  @override
  Widget build(BuildContext context) {
    final TextEditingController commentController = TextEditingController();
    String filingRate = "Bad";
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
                                heroTag: "card",
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
                                heroTag: "accept",
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.green,
                                child: const Icon(Icons.check_circle),
                                onPressed: () {
                                  alertDialogRate(
                                      context,
                                      "ثبت نظر شما",
                                      Column(
                                        children: [
                                          TextLable(
                                              text:
                                                  " با تشکر از اعتماد شما نظر خود را ثبت کنید",
                                              colorText: bgColor,
                                              fontWeightText: FontWeight.w600,
                                              fontSizeText:
                                                  getWidth(context, 0.04),
                                              textAlign: TextAlign.center),
                                          SizedBox(
                                            height: getHeight(context, 0.02),
                                          ),
                                          Container(
                                              child: RatingBar.builder(
                                            initialRating: 3,
                                            itemCount: 5,
                                            itemBuilder: (context, index) {
                                              switch (index) {
                                                case 0:
                                                  return const Icon(
                                                    Icons
                                                        .sentiment_very_dissatisfied,
                                                    color: Colors.red,
                                                  );
                                                case 1:
                                                  return const Icon(
                                                    Icons
                                                        .sentiment_dissatisfied,
                                                    color: Colors.redAccent,
                                                  );
                                                case 2:
                                                  return const Icon(
                                                    Icons.sentiment_neutral,
                                                    color: Colors.amber,
                                                  );
                                                case 3:
                                                  return const Icon(
                                                    Icons.sentiment_satisfied,
                                                    color: Colors.lightGreen,
                                                  );
                                                case 4:
                                                  return const Icon(
                                                    Icons
                                                        .sentiment_very_satisfied,
                                                    color: Colors.green,
                                                  );

                                                default:
                                                  return const Icon(
                                                    Icons
                                                        .sentiment_very_dissatisfied,
                                                    color: Colors.green,
                                                  );
                                              }
                                            },
                                            onRatingUpdate: (rating) {
                                              filingRate = FeelingTypeExtensions
                                                  .translateToFarsi(rating);

                                              print(filingRate);
                                            },
                                          )),
                                          SizedBox(
                                            height: getHeight(context, 0.02),
                                          ),
                                          MultiLineTextInput(
                                            hintText:
                                                "نظرات خود را یاداشت کنید",
                                            icon: Icons.comment,
                                            maxLine: 3,
                                            minLine: 1,
                                            controller: commentController,
                                            onSaved: (p0) {},
                                            validation: Uservalidator
                                                .commentUserValidator,
                                          ),
                                          SizedBox(
                                            height: getHeight(context, 0.02),
                                          ),
                                        ],
                                      ),
                                      SquereButton(
                                        text: "تایید نظر",
                                        color: bgColor,
                                        textColor: Colors.white,
                                        press: () {
                                          context.read<ActiveBloc>().add(
                                              FinishRequestEvent(
                                                  finishNurse: FinishedNurse(
                                                      rate: filingRate,
                                                      feelingDescription:
                                                          commentController
                                                              .text,
                                                      requestCode:
                                                          activeRequestList
                                                              .requestCode)));
                                        },
                                      ));
                                },
                              ),
                              FloatingActionButton(
                                heroTag: "Reject1",
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
                                heroTag: "call",
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
                                heroTag: "Reject",
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
