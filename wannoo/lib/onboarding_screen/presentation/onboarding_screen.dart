import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wannoo/constants.dart';
import 'package:wannoo/routes.dart';

import '../../Components/introscreen/intro_screen_onboarding.dart';
import 'onboarding_controller.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    OnBoardingController controller = Get.put(OnBoardingController());
    return Scaffold(
      body: IntroScreenOnboarding(
          backgroudColor: ThemeColor.colorBgPrimary,
          foregroundColor: ThemeColor.colorBgSecondory,
          introductionList: controller.list,
          onTapSkipButton: () {
            Get.toNamed(AppRoutes.login);
          },
          skipTextStyle: const TextStyle(color: ThemeColor.colorLink)),
    );
  }
}
