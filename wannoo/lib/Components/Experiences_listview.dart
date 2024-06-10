import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wannoo/Components/experiences_card.dart';
import 'package:wannoo/homepage/presentationlayer/widgets/category_card.dart';

import '../homepage/presentationlayer/homepage_controller.dart';

class ExperiencesListview extends StatelessWidget {
  final HomePageController homePageController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height/5,
      width: Get.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: homePageController.experiences.length,
        itemBuilder: (context, index) {
          return ExperiencesCard(
            title: homePageController.experiences[index].title,
            imagePath: homePageController.experiences[index].imagepath, location:homePageController.experiences[index].location ,

          );
        },
      ),
    );
  }
}
