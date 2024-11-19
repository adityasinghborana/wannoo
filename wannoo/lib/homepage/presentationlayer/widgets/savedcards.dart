import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import '../../../Constants.dart';

class SavedCards extends StatelessWidget {
  final String title;
  final String imagePath;
  final String Date;
  final String Body;

  const SavedCards({
    required this.title,
    required this.imagePath,
    required this.Date,
    required this.Body,
  });


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        padding: EdgeInsets.all(globalPadding.px_sm),
        height: Get.height / 7.9,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(globalRadius.borderRadius_s),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 6,
                blurRadius: 10)
          ],
          color: themeColor
              .colorBgPrimary, // Optional: background color for visibility
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Flexible(
              flex: 2,
              child: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(image.homeimage),
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
                      Text(title, style: CustomTextStyles.fontMdSemiBold,)
                    ],
                  ),
                  Container(
                    child: Row(
                      children: [

                        Flexible(
                          child: HtmlWidget(
textStyle: CustomTextStyles.fontSMedium,
                              Body.substring(0,50),

                              ),
                            ),

                      ],
                    ),
                  ),
                  Row(
                    children: [

                      Text(
                     Date.substring(0,10),
                        style: CustomTextStyles.fontSMedium.copyWith(color: themeColor.colorTextSecondry)
                      ),
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