import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wannoo/components/large_button.dart';
import 'package:wannoo/constants.dart';
import 'package:wannoo/routes.dart';
import 'package:wannoo/styles.dart';

class CongratultionsPage extends StatelessWidget {
  const CongratultionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(image.congo),
          const SizedBox(
            height: Height.heightButtonLarge,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: GlobalPadding.buttonSmallpx,
                vertical: GlobalPadding.buttonSmallpy),
            child: Text(
              staticText.congoScreenText,
              style: TypographyStyle.l2Font,
            ),
          ),
          const SizedBox(
            height: Height.heightButtonLarge,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: GlobalPadding.buttonSmallpx,
                vertical: GlobalPadding.buttonSmallpy),
            child: LargeButton(
              label: staticText.congoScreenButtonText,
              onPressed: () {
                Get.toNamed(AppRoutes.home);
              },
            ),
          )
        ],
      ),
    );
  }
}
