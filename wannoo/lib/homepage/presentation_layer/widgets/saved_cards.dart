import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import '../../../constants.dart';

class SavedCards extends StatelessWidget {
  final String title;
  final String imagePath;
  final String date;
  final String body;

  const SavedCards({
    super.key,
    required this.title,
    required this.imagePath,
    required this.date,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        padding: const EdgeInsets.all(GlobalPadding.px_sm),
        height: Get.height / 7.9,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(GlobalRadius.borderRadius_s),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 6,
                blurRadius: 10)
          ],
          color: ThemeColor
              .colorBgPrimary, // Optional: background color for visibility
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Flexible(
              flex: 2,
              child: CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage("$baseurl/$imagePath"),
              ),
            ),
            Flexible(
              flex: 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        title,
                        style: CustomTextStyles.fontMdSemiBold,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: HtmlWidget(
                          textStyle: CustomTextStyles.fontSMedium,
                          body.substring(0, 50),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(date.substring(0, 10),
                          style: CustomTextStyles.fontSMedium
                              .copyWith(color: ThemeColor.colorTextSecondry)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
