import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wannoo/Blogs/presentationlayer/blogscontroller.dart';
import 'package:wannoo/Constants.dart';
import 'package:wannoo/homepage/presentationlayer/widgets/savedcards.dart';

import 'SingleBlogScreen.dart';

class BlogsScreen extends StatelessWidget {
  const BlogsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final BlogsController blogsController = Get.put(BlogsController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Blogs", style: CustomTextStyles.fontL2SemiBold),
      ),
      body: Obx(() {
        if (blogsController.allBlogsList.isEmpty) {
          return Center(child: Text("No blogs available"));
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
                  Date: item.createdAt!,
                  Body: item.content!,
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
