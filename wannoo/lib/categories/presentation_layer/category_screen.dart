import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wannoo/categories/presentation_layer/category_controller.dart';
import 'package:wannoo/constants.dart';
import 'package:wannoo/routes.dart';

class AllCategoryScreen extends StatelessWidget {
  const AllCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CategoryController categoryController = Get.find();
    return Drawer(
      child: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: ListTile(
                title: const Text('Categories'),
                titleTextStyle: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            SliverList.builder(
              itemCount: categoryController.category.length,
              itemBuilder: (BuildContext context, int index) {
                return Obx(
                  () {
                    final cat = categoryController.category[index];
                    return ListTile(
                      leading: Image.network(
                        '$baseurl/${cat.imagepath}',
                        height: 24,
                        width: 24,
                        errorBuilder: (context, error, stackTrace) =>
                            const SizedBox.shrink(),
                      ),
                      title: Text(cat.title),
                      onTap: () {
                        Get.toNamed(
                          AppRoutes.categoryplaces,
                          parameters: {
                            "category": categoryController.category[index].title
                          },
                        );
                      },
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
