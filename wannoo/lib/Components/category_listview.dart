import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wannoo/homepage/presentationlayer/widgets/category_card.dart';

import '../homepage/presentationlayer/homepage_controller.dart';

class CustomListCategory extends StatelessWidget {
  final HomePageController homePageController = Get.find();




  @override
  Widget build(BuildContext context) {

    return Container(
      height: 100,
      width: Get.width,
      child: ListView.builder(

        scrollDirection: Axis.horizontal,
        itemCount: homePageController.category.length,
        itemBuilder: (context, index) {
          return CategoryCard(title: homePageController.category[index].title, imagePath: homePageController.category[index].imagepath,);
        },
      ),
    );
  }
}