import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intro_screen_onboarding_flutter/introduction.dart';
import 'package:wannoo/Constants.dart';

class OnBoardingController extends GetxController{
  List<Introduction> list = [
    Introduction(
      title: staticText.story1Heading,
      subTitle: staticText.story1Body,
      imageUrl: image.storyBoard1,
    ),
    Introduction(
      title: staticText.story2Heading,
      subTitle: staticText.story2Body,
      imageUrl: image.storyBoard2,
    ),
    Introduction(

      title: staticText.story3Heading,
      subTitle: staticText.story3Body,
      imageUrl: image.storyBoard3,
    ),
  ];

}