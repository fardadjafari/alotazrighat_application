import 'package:alotazrighat_application/constants/constans_variable.dart';
import 'package:alotazrighat_application/repository/models/request/active_request_model.dart';
import 'package:alotazrighat_application/repository/models/request/enums/request_status.dart';
import 'package:alotazrighat_application/repository/models/request/result_request_list.dart';
import 'package:alotazrighat_application/tools/digit/date_time.dart';
import 'package:alotazrighat_application/widget/color_utility.dart';
import 'package:alotazrighat_application/widget/lable/text_lable.dart';
import 'package:alotazrighat_application/widget/media_query.dart';
import 'package:alotazrighat_application/widget/shapes/space.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'item_request.dart';

class RequestAllItem extends StatelessWidget {
  const RequestAllItem({super.key, required this.resultItem});
  final ResultRequst resultItem;

  @override
  Widget build(BuildContext context) {
    if (resultItem.status == RequestStatus.Finish) {
      return Container(
          width: getAllWidth(context),
          child: Stack(
            children: <Widget>[
              Card(
                margin: const EdgeInsets.only(top: 20.0),
                color: bgColor,
                child: SizedBox(
                    height: getHeight(context, 0.55),
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
                                  "${resultItem.nurseFirstName} ${resultItem.nurseLastName}",
                              colorText: buttonTextColor,
                              fontWeightText: FontWeight.w500,
                              fontSizeText: getWidth(context, 0.038),
                              textAlign: TextAlign.center),
                          SizedBox(
                            height: getHeight(context, 0.02),
                          ),
                          ItemRequest(
                              title: "کد پیگیری",
                              value: resultItem.requestCode),
                          const Sperstor(
                            color: Colors.white,
                          ),
                          ItemRequest(
                              title: "خدمت درخواستی",
                              value: resultItem.serviceTitle),
                          const Sperstor(
                            color: Colors.white,
                          ),
                          ItemRequest(
                              title: "تعداد",
                              value: resultItem.serviceQuantity
                                  .toString()
                                  .replaceAll(RegExp(r'([.]*0)(?!.*\d)'), '')),
                          const Sperstor(
                            color: Colors.white,
                          ),
                          ItemRequest(
                              title: "زمان ثبت",
                              value: ConvertDateTime.toShamsi(
                                  resultItem.createAt)),
                          const Sperstor(
                            color: Colors.white,
                          ),
                          ItemRequest(
                              title: "وضعیت",
                              value: RequestStatusExtensions.translateToFarsi(
                                  resultItem.status.index)),
                          const Sperstor(
                            color: Colors.white,
                          ),
                          ItemRequest(
                              title: "مبلغ پرداختی",
                              value:
                                  " ${NumberFormat('###,###,000').format(resultItem.finalPrice)} ریال"),
                          const Sperstor(
                            color: Colors.white,
                          ),
                          ItemRequest(
                              title: "مقدار تخفیف",
                              value: resultItem.discountAmountPrice != 0
                                  ? " ${NumberFormat('###,###,000').format(resultItem.discountAmountPrice)} ریال"
                                  : "استفاده نشده است "),
                          SizedBox(
                            height: getHeight(context, 0.03),
                          )
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
                    backgroundImage: NetworkImage(
                        StaticVariable.userAvatar + resultItem.nurseAvatar!),
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
                              value: resultItem.serviceTitle),
                          const Sperstor(
                            color: Colors.white,
                          ),
                          ItemRequest(
                              title: "تعداد",
                              value: resultItem.serviceQuantity
                                  .toString()
                                  .replaceAll(RegExp(r'([.]*0)(?!.*\d)'), '')),
                          const Sperstor(
                            color: Colors.white,
                          ),
                          ItemRequest(
                              title: "زمان ثبت",
                              value: ConvertDateTime.toShamsi(
                                  resultItem.createAt)),
                          const Sperstor(
                            color: Colors.white,
                          ),
                          ItemRequest(
                              title: "وضعیت",
                              value: RequestStatusExtensions.translateToFarsi(
                                  resultItem.status.index)),
                          const Sperstor(
                            color: Colors.white,
                          ),
                          ItemRequest(
                              title: "مبلغ پرداختی",
                              value:
                                  "${NumberFormat('###,###,000').format(resultItem.finalPrice)} ریال"),
                          const Sperstor(
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: getHeight(context, 0.03),
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
