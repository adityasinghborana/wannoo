import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wannoo/Constants.dart';
import 'package:wannoo/styles.dart';

class ServicesCard extends StatelessWidget {
  final String imagePath;
  final String title;

  const ServicesCard({super.key, required this.imagePath, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: globalPadding.px_md,vertical: 5),
      child: Material(
        color: themeColor.colorWhite,
        borderRadius: BorderRadius.circular(globalRadius.borderRadius_m),
        elevation: 8,
        child: Container(
          width: 110,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [Image.asset(imagePath,height: 18,width: 18,), Text(title,style: TypographyStyle.mdFont,)],
          ),
        ),
      ),
    );
  }
}
