import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wannoo/categories/presentationlayer/categorycontroller.dart';
import 'package:wannoo/homepage/presentationlayer/widgets/category_card.dart';

class AllCategoryScreen extends StatelessWidget {
  AllCategoryScreen({super.key});

  final CategoryController categoryController = Get.find();

  @override
  Widget build(BuildContext context) {
    print(categoryController.category);
    return Scaffold(
      appBar: AppBar(
        title: Text("Categories"),
        centerTitle: true,
      ),
        body: GridView.builder(gridDelegate:
        const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
            itemCount: categoryController.category.length,
            itemBuilder: (BuildContext context , int index) {
              return Obx(() {
                return CategoryCard(
                    imagePath: categoryController.category[index].imagepath,
                    title: categoryController.category[index].title);
              });
            }
        ));
  }
}
