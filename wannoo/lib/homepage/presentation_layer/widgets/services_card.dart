import 'package:flutter/material.dart';
import 'package:wannoo/constants.dart';
import 'package:wannoo/styles.dart';

class ServicesCard extends StatelessWidget {
  final String imagePath;
  final String title;

  const ServicesCard({super.key, required this.imagePath, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: GlobalPadding.px_md, vertical: 5),
      child: Material(
        color: ThemeColor.colorWhite,
        borderRadius: BorderRadius.circular(GlobalRadius.borderRadiusMedium),
        elevation: 8,
        child: SizedBox(
          width: 110,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                imagePath,
                height: 18,
                width: 18,
              ),
              Text(
                title,
                style: TypographyStyle.mdFont,
              )
            ],
          ),
        ),
      ),
    );
  }
}
