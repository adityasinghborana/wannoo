import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wannoo/Blogs/presentationlayer/blogscontroller.dart';
import 'package:wannoo/Constants.dart';
import 'package:wannoo/homepage/presentationlayer/widgets/savedcards.dart';

class BlogsScreen extends StatelessWidget {
  const BlogsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final BlogsController blogsController =Get.put(BlogsController());
    return Scaffold(
      appBar: AppBar(title: Text("Blogs",style: CustomTextStyles.fontL2SemiBold,),),
      body: ListView.builder(

          itemCount: blogsController.allBlogsList.length,
          itemBuilder: (context , index){
        var item = blogsController.allBlogsList[index];
        return SavedCards(title: item.title!, imagePath: "", Date: item.createdAt!, Body: item.content!,);
      }),
    );
  }
}
