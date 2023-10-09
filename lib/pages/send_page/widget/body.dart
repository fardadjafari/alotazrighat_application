import 'package:alotazrighat_application/constants/constans_variable.dart';
import 'package:alotazrighat_application/pages/layout_page.dart';
import 'package:alotazrighat_application/pages/send_page/logic/bloc/send_bloc.dart';
import 'package:alotazrighat_application/pages/send_page/widget/detail_item.dart';
import 'package:alotazrighat_application/pages/send_page/widget/location_picker.dart';
import 'package:alotazrighat_application/pages/send_page/widget/section_discount.dart';
import 'package:alotazrighat_application/repository/models/request/detail_service.dart';
import 'package:alotazrighat_application/repository/models/request/type_service.dart';
import 'package:alotazrighat_application/tools/validator/user_validator.dart';
import 'package:alotazrighat_application/widget/button/squre_button.dart';
import 'package:alotazrighat_application/widget/color_utility.dart';
import 'package:alotazrighat_application/widget/input/combo_input.dart';
import 'package:alotazrighat_application/widget/input/multiline_input.dart';
import 'package:alotazrighat_application/widget/input/numeric_input.dart';
import 'package:alotazrighat_application/widget/input/text_input.dart';
import 'package:alotazrighat_application/widget/lable/text_lable.dart';
import 'package:alotazrighat_application/widget/loading/loading_widget.dart';
import 'package:alotazrighat_application/widget/media_query.dart';
import 'package:alotazrighat_application/widget/popup/awesome_alert.dart';
import 'package:alotazrighat_application/widget/popup/snack_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class Body extends StatefulWidget {
  const Body({super.key, required this.uniqCode});
  final String uniqCode;

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController discountController = TextEditingController();
  List<Map<dynamic, String>>? modelCity;
  List<Map<dynamic, String>>? modelArea;
  TypeService? modelDetail;
  DetailService? singleDetail;
  double? price = 0;
  double? unitPrice = 0;
  int quntity = 1;
  bool activeInputCity = false;
  bool haveDiscountCode = false;

  //form value
  late String sexValue;
  late String sexNurseValue;
  late String areaValue;
  String serviceValue = "";

  @override
  void initState() {
    context.read<SendBloc>().add(LoadDataEvent(
        uniqueCode: widget.uniqCode, allCities: null, typeService: null));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: getWidth(context, 0.16)),
      child: BlocConsumer<SendBloc, SendState>(
        listener: (context, state) {
          if (state.sendEvent is FailedRequestEvent) {
            getSnackBarWidget(
                context, "ثبت درخواست شما با مشکلی مواجه شد", Colors.red);
            Navigator.pushNamed(context, Layout.screenId);
          }
          if (state.sendEvent is RedirectToPayEvent) {
            var modelCall = state.sendEvent as RedirectToPayEvent;
            launchUrl(Uri.parse(
                "${StaticVariable.payUrl}${modelCall.requestCode}?source=Mobile"));
            Navigator.pushNamed(context, Layout.screenId);
          }
          if (state.sendEvent is CheckPermisionEvent) {
            context.read<SendBloc>().add(CheckPermisionEvent());
          }
          if (state.sendEvent is RejectDiscount) {
            getSnackBarWidget(
                context, "کد تخفیف وارد شده صحیح نمی باشد", Colors.red);
            discountController.clear();
            setState(() {
              haveDiscountCode = false;
            });
          }
          if (state.sendEvent is TurnOnGPSEvent) {
            alertDialogWarning(
              context,
              "مشکل",
              "GPS تلفن همراه خود را فعال کنید",
              "تلاش مجدد",
              () {
                context.read<SendBloc>().add(LoadDicountPage());
              },
            );
          }

          if (state.sendEvent is FaildPermisionEvent) {
            alertDialogWarning(
              context,
              "مشکل",
              "مشکل دسترسی به مکان شما",
              "تلاش مجدد",
              () {
                context.read<SendBloc>().add(LoadDicountPage());
              },
            );
          }
        },
        builder: (context, state) {
          if (state.sendEvent is LoadDataEvent ||
              state.sendEvent is CompletedAreaEvent) {
            if (state.sendEvent is LoadDataEvent) {
              var model = (state.sendEvent as LoadDataEvent).allCities;
              modelCity = model != null
                  ? model.map((index) => {index.id: index.name}).toList()
                  : [
                      {"empty": "ایتمی وجود ندارد"}
                    ];

              modelDetail = (state.sendEvent as LoadDataEvent).typeService;

              if (modelDetail!.types.length == 1) {
                singleDetail = modelDetail!.types[0];
                price = price == 0 ? singleDetail!.price : price;
                if (serviceValue.isEmpty) {
                  serviceValue = singleDetail!.id;
                }
              }
            }
            if (modelDetail!.types.length > 1) {
              price = price ?? modelDetail!.types[0].price;
            }

            if (state.sendEvent is CompletedAreaEvent) {
              var model = (state.sendEvent as CompletedAreaEvent).allAreas;
              modelArea = model.isNotEmpty
                  ? model.map((index) => {index.id: index.name}).toList()
                  : [
                      {"empty": "ابتدا شهر خود را مشخص کنید"}
                    ];
            }
            return SingleChildScrollView(
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.always,
                child: Container(
                  width: getAllWidth(context),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DetailItem(
                        title: modelDetail!.title,
                        imagePath: modelDetail!.icon,
                        uniqueCode: widget.uniqCode,
                        widget: singleDetail != null
                            ? [
                                SizedBox(
                                  height: getHeight(context, 0.035),
                                ),
                                TextLable(
                                    text:
                                        "${NumberFormat('###,###,000').format(price)} ریال",
                                    colorText: bgColor,
                                    fontWeightText: FontWeight.w400,
                                    fontSizeText: getWidth(context, 0.05),
                                    textAlign: TextAlign.center),
                                SizedBox(
                                  height: getHeight(context, 0.05),
                                ),
                                modelDetail!.isCountable
                                    ? NumericStepButton(
                                        minValue: 1,
                                        maxValue: 10,
                                        onChanged: (value) {
                                          quntity = value;
                                          setState(() {
                                            price = calculatorPrice(
                                                value, singleDetail!.price);
                                          });
                                        },
                                      )
                                    : SizedBox()
                              ]
                            : [
                                TextLable(
                                    text: price == 0
                                        ? "نوع تزریقات را مشخص کنید"
                                        : "${NumberFormat('###,###,000').format(price)} ریال",
                                    colorText: bgColor,
                                    fontWeightText: FontWeight.w400,
                                    fontSizeText: getWidth(context, 0.04),
                                    textAlign: TextAlign.center),
                                SizedBox(
                                  height: getHeight(context, 0.02),
                                ),
                                ComboBoxFormField(
                                    text: "نوع",
                                    items: modelDetail!.types
                                        .map((index) => {index.id: index.name})
                                        .toList(),
                                    onChanged: (value) {
                                      setState(() {
                                        serviceValue = value;
                                        unitPrice = modelDetail!.types
                                            .singleWhere((o) => o.id == value)
                                            .price;

                                        price = calculatorPrice(
                                            quntity, unitPrice!);
                                      });
                                    }),
                                SizedBox(
                                  height: getHeight(context, 0.02),
                                ),
                                NumericStepButton(
                                  minValue: 1,
                                  maxValue: 10,
                                  onChanged: (value) {
                                    quntity = value;
                                    setState(() {
                                      price =
                                          calculatorPrice(value, unitPrice!);
                                    });
                                  },
                                )
                              ],
                      ),
                      SizedBox(height: getHeight(context, 0.03)),
                      ComboBoxFormField(
                        text: "جنسیت بیمار",
                        onChanged: (value) {
                          sexValue = value;
                        },
                        items: const [
                          {"Male": "مرد"},
                          {"Female": "زن"}
                        ],
                      ),
                      SizedBox(
                        height: getHeight(context, 0.03),
                      ),
                      ComboBoxFormField(
                        text: "جنسیت پرستار",
                        onChanged: (value) {
                          sexNurseValue = value;
                        },
                        items: const [
                          {"Male": "مرد"},
                          {"Female": "زن"},
                          {"g": "تفاوتی ندارد"}
                        ],
                      ),
                      SizedBox(
                        height: getHeight(context, 0.03),
                      ),
                      AbsorbPointer(
                        absorbing: activeInputCity,
                        child: ComboBoxFormField(
                          text: "شهر",
                          onChanged: (value) {
                            setState(() {
                              activeInputCity = true;
                            });
                            context
                                .read<SendBloc>()
                                .add(LoadAreaEvent(cityId: value));
                          },
                          items: modelCity!,
                        ),
                      ),
                      SizedBox(
                        height: getHeight(context, 0.03),
                      ),
                      ComboBoxFormField(
                        text: "منطقه",
                        onChanged: (value) {
                          areaValue = value;
                        },
                        items: modelArea,
                      ),
                      SizedBox(
                        height: getHeight(context, 0.03),
                      ),
                      MultiLineTextInput(
                        minLine: 1,
                        maxLine: 3,
                        controller: addressController,
                        hintText: "آدرس",
                        icon: Icons.add_home_work_sharp,
                        onSaved: (p0) {},
                        error: "خطا",
                        validation: Uservalidator.addressUserValidator,
                      ),
                      SizedBox(
                        height: getHeight(context, 0.03),
                      ),
                      SquereButton(
                        text: "ثبت درخواست",
                        color: bgColor,
                        textColor: Colors.white,
                        press: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<SendBloc>().add(InitialDicountPage());
                          }
                        },
                      )
                    ],
                  ),
                ),
              ),
            );
          }

          if (state.sendEvent is LoadDicountPage ||
              state.sendEvent is RejectDiscount) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SectionDiscount(
                  isActive: haveDiscountCode,
                  function: (value) {
                    setState(() {
                      haveDiscountCode = value!;
                    });
                  },
                ),
                Visibility(
                  visible: haveDiscountCode,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextInput(
                            icon: Icons.discount,
                            hintText: "کد تخفیف خود را وارد کنید",
                            onSaved: (p0) {},
                            controller: discountController,
                            validation: (p0) {
                              return null;
                            },
                          )
                        ],
                      ),
                      SizedBox(
                        height: getHeight(context, 0.05),
                      )
                    ],
                  ),
                ),
                SquereButton(
                  text: "مرحله بعد",
                  color: bgColor,
                  press: () {
                    context
                        .read<SendBloc>()
                        .add(AppliedDiscount(code: discountController.text));
                  },
                )
              ],
            );
          }

          if (state.sendEvent is InitialMapPageEvent) {
            final InitialMapPageEvent model =
                state.sendEvent as InitialMapPageEvent;
            return LocationPicker(model.lang, model.laut,
                sex: sexValue,
                nurseSex: sexNurseValue,
                areaId: areaValue,
                quantity: quntity,
                address: addressController.text,
                serviceTypeId: serviceValue,
                discountCode: discountController.text);
          }

          return Center(
            child: LoadingWidget(
              size: getHeight(context, 0.00019),
              color: bgColor,
            ),
          );
        },
      ),
    );
  }

  double calculatorPrice(int count, double price) {
    return count * price;
  }
}
