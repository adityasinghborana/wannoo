import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../homepage/presentation_layer/homepage_controller.dart';

import '../homepage/presentation_layer/widgets/services_card.dart';

class ServicesListview extends StatelessWidget {
  final HomePageController homePageController = Get.find();
  ServicesListview({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: Get.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: homePageController.category.length,
        itemBuilder: (context, index) {
          return ServicesCard(
            title: homePageController.category[index].title,
            imagePath: homePageController.category[index].imagepath,
          );
        },
      ),
    );
  }
}
