import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wannoo/categories/presentation_layer/category_controller.dart';
import 'package:wannoo/homepage/presentation_layer/widgets/category_card.dart';
import 'package:wannoo/routes.dart';

class AllCategoryScreen extends StatelessWidget {
  AllCategoryScreen({super.key});

  final CategoryController categoryController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Categories"),
        centerTitle: true,
      ),
      body: GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
        itemCount: categoryController.category.length,
        itemBuilder: (BuildContext context, int index) {
          return Obx(
            () {
              return CategoryCard(
                imagePath: categoryController.category[index].imagepath,
                title: categoryController.category[index].title,
                onTap: () {
                  Get.toNamed(AppRoutes.categoryplaces, parameters: {
                    "category": categoryController.category[index].title
                  });
                },
              );
            },
          );
        },
      ),
    );
  }
}
