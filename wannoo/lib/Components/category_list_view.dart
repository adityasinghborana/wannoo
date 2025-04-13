import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wannoo/constants.dart';
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
        height: MediaQuery.of(context).textScaler.scale(40),
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          scrollDirection: Axis.horizontal,
          itemCount: homePageController.category.length,
          itemBuilder: (context, index) {
            return Obx(
              () {
                final cat = homePageController.category[index];
                return ChoiceChip(
                  label: Text(cat.title),
                  avatar: Image.network(
                    '$baseurl/${cat.imagepath}',
                    width: 24,
                    height: 24,
                  ),
                  selected: false,
                  onSelected: (selected) => Get.toNamed(
                    AppRoutes.categoryplaces,
                    parameters: {
                      "category": homePageController.category[index].title
                    },
                  ),
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
