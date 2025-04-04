import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:wannoo/blogs/data_layer/model/response/all_blogs_model.dart';
import 'package:wannoo/blogs/data_layer/repository/blogs_repository.dart';
import 'package:wannoo/blogs/data_layer/service/blogsremote.dart';
import 'package:wannoo/blogs/data_layer/usecase/getallblogsusecase.dart';
import 'package:wannoo/utilities/dialog.dart';

class BlogsController extends GetxController {
  @override
  void onInit() {
    getAllBlogs();
    super.onInit();
  }

  final List<AllBlogsModel> allBlogsList = <AllBlogsModel>[].obs;

  final GetAllBlogsUseCase getAllBlogsUseCase =
      GetAllBlogsUseCase(BlogsRepoImpl(Blogsremote(Dio())));

  void getAllBlogs() async {
    try {
      await getAllBlogsUseCase
          .execute()
          .then((res) => allBlogsList.assignAll(res));
      debugPrint(allBlogsList.toList().toString());
    } catch (e) {
      showSnackBar(Get.context!, "$e", state: StateType.error);
    }
  }
}
