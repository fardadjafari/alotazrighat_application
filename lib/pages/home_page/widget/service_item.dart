import 'package:alotazrighat_application/pages/home_page/widget/service_picture.dart';
import 'package:alotazrighat_application/widget/color_utility.dart';
import 'package:alotazrighat_application/widget/lable/text_lable.dart';
import 'package:alotazrighat_application/widget/media_query.dart';
import 'package:flutter/material.dart';

class ServiceItem extends StatelessWidget {
  const ServiceItem({super.key, required this.title, required this.imagePath});

  final String title;

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(getHeight(context, 0.01)),
      child: Expanded(
        child: Container(
          alignment: Alignment.center,
          height: getHeight(context, 0.15),
          child: Card(
            color: Colors.grey[100],
            shadowColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                Expanded(
                    child: ServiceImage(
                  logoPath: imagePath,
                )),
                Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: getWidth(context, 0.035),
                          vertical: getHeight(context, 0.04)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          TextLable(
                            text: title,
                            colorText: frColor,
                            fontSizeText: getWidth(context, 0.038),
                            fontWeightText: FontWeight.w700,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Spacer(),
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
