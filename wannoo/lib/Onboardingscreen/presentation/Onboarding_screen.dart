import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wannoo/Constants.dart';
import 'package:wannoo/routes.dart';

import '../../Components/introscreen/introscreenonboarding.dart';
import 'Onboarding_Controller.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    OnBoardingController controller = Get.put(OnBoardingController());
    return Scaffold(
      body: IntroScreenOnboarding(
          backgroudColor: themeColor.colorBgPrimary,
          foregroundColor: themeColor.colorBgSecondory,
          introductionList: controller.list,
          onTapSkipButton: () {
            Get.toNamed(AppRoutes.login);
          },
          skipTextStyle: const TextStyle(color: themeColor.colorLink)),
    );
  }
}
