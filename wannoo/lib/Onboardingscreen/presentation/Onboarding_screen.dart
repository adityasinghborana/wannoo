
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:intro_screen_onboarding_flutter/introscreenonboarding.dart';
import 'package:wannoo/Constants.dart';
import 'package:wannoo/routes.dart';


import 'Onboarding_Controller.dart';

class OnBoardingScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    OnBoardingController controller = Get.put(OnBoardingController());
    return Scaffold(
    body: IntroScreenOnboarding(

      foregroundColor: themeColor.colorBgSecondory,
    introductionList: controller.list,
onTapSkipButton: () {
Get.toNamed(AppRoutes.login);
},
        skipTextStyle:TextStyle(color: themeColor.colorLink)
),
    );
  }
}
