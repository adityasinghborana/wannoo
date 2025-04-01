import 'package:get/get.dart';

import '../../Components/introscreen/introduction.dart';
import '../../Constants.dart';
import '../../styles.dart';

class OnBoardingController extends GetxController {
  List<Introduction> list = [
    Introduction(
      title: staticText.story1Heading,
      subTitle: staticText.story1Body,
      imageUrl: "asset/images/Story1.png",
      titleTextStyle: TypographyStyle.xxlFont,
      subTitleTextStyle: TypographyStyle.mdFont,
    ),
    Introduction(
      title: staticText.story2Heading,
      subTitle: staticText.story2Body,
      imageUrl: image.storyBoard2,
      titleTextStyle: TypographyStyle.xxlFont,
      subTitleTextStyle: TypographyStyle.mdFont,
    ),
    Introduction(
      title: staticText.story3Heading,
      subTitle: staticText.story3Body,
      imageUrl: image.storyBoard3,
      titleTextStyle: TypographyStyle.xxlFont,
      subTitleTextStyle: TypographyStyle.mdFont,
    ),
  ];
}
