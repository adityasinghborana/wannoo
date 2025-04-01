import 'package:get/get.dart';
import '../../Components/introscreen/introduction.dart';
import '../../constants.dart';
import '../../styles.dart';

class OnBoardingController extends GetxController {
  List<Introduction> list = [
    Introduction(
      title: StaticText.story1Heading,
      subTitle: StaticText.story1Body,
      imageUrl: "asset/images/Story1.png",
      titleTextStyle: TypographyStyle.xxlFont,
      subTitleTextStyle: TypographyStyle.mdFont,
    ),
    Introduction(
      title: StaticText.story2Heading,
      subTitle: StaticText.story2Body,
      imageUrl: StaticImage.storyBoard2,
      titleTextStyle: TypographyStyle.xxlFont,
      subTitleTextStyle: TypographyStyle.mdFont,
    ),
    Introduction(
      title: StaticText.story3Heading,
      subTitle: StaticText.story3Body,
      imageUrl: StaticImage.storyBoard3,
      titleTextStyle: TypographyStyle.xxlFont,
      subTitleTextStyle: TypographyStyle.mdFont,
    ),
  ];
}
