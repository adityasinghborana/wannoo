import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:wannoo/Constants.dart';
import 'package:wannoo/styles.dart';

import '../../Components/introscreen/introduction.dart';

class OnBoardingController extends GetxController{
  List<Introduction> list = [
    Introduction(
      title: staticText.story1Heading,
      subTitle: staticText.story1Body,
      imageUrl: image.storyBoard1,
      titleTextStyle:TypographyStyle.xxlFont,
      subTitleTextStyle: TypographyStyle.mdFont,
    ),
    Introduction(
      title: staticText.story2Heading,
      subTitle: staticText.story2Body,
      imageUrl: image.storyBoard2,
      titleTextStyle:TypographyStyle.xxlFont,
      subTitleTextStyle: TypographyStyle.mdFont,
    ),
    Introduction(

      title: staticText.story3Heading,
      subTitle: staticText.story3Body,
      imageUrl: image.storyBoard3,
      titleTextStyle:TypographyStyle.xxlFont,
      subTitleTextStyle: TypographyStyle.mdFont,
    ),
  ];

}