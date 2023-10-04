import 'package:alotazrighat_application/pages/send_page/widget/detail_picture.dart';
import 'package:alotazrighat_application/widget/color_utility.dart';
import 'package:alotazrighat_application/widget/lable/text_lable.dart';
import 'package:alotazrighat_application/widget/media_query.dart';
import 'package:flutter/material.dart';

class DetailItem extends StatelessWidget {
  const DetailItem({
    super.key,
    required this.title,
    required this.imagePath,
    required this.uniqueCode,
    required this.widget,
  });

  final String uniqueCode;

  final String title;

  final String imagePath;

  final List<Widget> widget;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            alignment: Alignment.center,
            height: getHeight(context, 0.27),
            child: Card(
              color: Colors.grey[100],
              shadowColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      flex: 1,
                      child: Padding(
                        padding: EdgeInsets.only(
                            right: getWidth(context, 0.07),
                            top: getHeight(context, 0.03)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DetailImage(
                              logoPath: imagePath,
                            ),
                            SizedBox(
                              height: getHeight(context, 0.02),
                            ),
                            TextLable(
                              text: title,
                              colorText: frColor,
                              fontSizeText: getWidth(context, 0.04),
                              fontWeightText: FontWeight.w700,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Spacer(),
                          ],
                        ),
                      )),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: getWidth(context, 0.04),
                          top: getHeight(context, 0.008)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: widget,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
