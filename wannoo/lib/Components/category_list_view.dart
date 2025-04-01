import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wannoo/homepage/presentation_layer/widgets/category_card.dart';
import 'package:wannoo/routes.dart';

import '../homepage/presentation_layer/homepage_controller.dart';

class CustomListCategory extends StatelessWidget {
  final HomePageController homePageController = Get.find();
  final String? category = Get.parameters["category"];

  CustomListCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return SizedBox(
        height: 88 + 16,
        child: ListView.separated(
          padding: const EdgeInsets.only(
            top: 4,
            bottom: 12,
            left: 16,
            right: 16,
          ),
          scrollDirection: Axis.horizontal,
          itemCount: homePageController.category.length,
          itemBuilder: (context, index) {
            return Obx(
              () {
                return CategoryCard(
                  title: homePageController.category[index].title,
                  imagePath: homePageController.category[index].imagepath,
                  onTap: () {
                    Get.toNamed(AppRoutes.categoryplaces, parameters: {
                      "category": homePageController.category[index].title
                    });
                  },
                );
              },
            );
          },
          separatorBuilder: (context, index) => const SizedBox(width: 8),
        ),
      );
    });
  }
}
