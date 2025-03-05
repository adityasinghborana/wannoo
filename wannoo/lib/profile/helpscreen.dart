import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:wannoo/Constants.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Help And Support"),
          centerTitle: true,
        ),
        body: Center(
          child: InfoCard(),
        ));
  }
}

class InfoCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.0),
      child: Container(
        padding: EdgeInsets.all(20.0),
        width: Get.width,
        decoration: BoxDecoration(
          color: themeColor.colorBgSecondory,
          borderRadius: BorderRadius.circular(25.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.05),
              offset: Offset(0, 10),
              blurRadius: 0,
              spreadRadius: 0,
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Info(
              icon: Icons.mail,
              infoTitle: 'Email Us',
              infoValue: 'Contact@wanno.com',
            ),
            Gap(20),
            Info(
              icon: Icons.phone,
              infoTitle: 'Call Us ',
              infoValue: 'Contact@wanno.com',
            ),
            Gap(20),
            Info(
              icon: Icons.mail,
              infoTitle: 'Reach Us ',
              infoValue: '23 street block 2 Nottingham South Hempstead',
            )
          ],
        ),
      ),
    );
  }
}

Widget Info(
    {required IconData icon,
    required String infoTitle,
    required String infoValue}) {
  return Row(
    children: [
      Icon(icon),
      SizedBox(width: 10),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            infoTitle,
            style: CustomTextStyles.fontXxlMedium,
          ),
          Container(
            width: 300,
            child: Wrap(children: [
              Text(
                infoValue,
                style: CustomTextStyles.fontXlMedium,
              )
            ]),
          ),
        ],
      )
    ],
  );
}
