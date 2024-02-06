
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:intro_screen_onboarding_flutter/introscreenonboarding.dart';
import 'package:wannoo/Onboardingscreen/presetation/Onboarding_Controller.dart';

class OnBoardingScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    OnBoardingController controller = Get.put(OnBoardingController());
    return Scaffold(
    body: IntroScreenOnboarding(
    introductionList: controller.list,
onTapSkipButton: () {}
),
    );
  }
}
