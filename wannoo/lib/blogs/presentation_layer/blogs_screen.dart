import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wannoo/blogs/presentation_layer/blogs_controller.dart';
import 'package:wannoo/homepage/presentation_layer/widgets/saved_cards.dart';

import 'single_blog_screen.dart';

class BlogsScreen extends StatelessWidget {
  const BlogsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final BlogsController blogsController = Get.put(BlogsController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Blogs"),
      ),
      body: Obx(() {
        if (blogsController.allBlogsList.isEmpty) {
          return const Center(child: Text("No blogs available"));
        }
        return ListView.builder(
          itemCount: blogsController.allBlogsList.length,
          itemBuilder: (context, index) {
            var item = blogsController.allBlogsList[index];
            return GestureDetector(
              onTap: () {
                // Navigate to the detail screen
                Get.to(() => BlogDetailScreen(blog: item));
              },
              child: Hero(
                tag: "blog-${item.id}", // Use a unique tag for each blog
                child: SavedCards(
                  title: item.title!,
                  imagePath: item.imagePath ?? "",
                  date: item.createdAt!,
                  body: item.content!,
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
