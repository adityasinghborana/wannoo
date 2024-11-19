import 'package:wannoo/Blogs/datalayer/service/blogsremote.dart';

import '../model/response/all_blogs_model.dart';

abstract class  BlogsRepo {
   Future<List<AllBlogsModel>> getAllBlogs();
}

@override
class BlogsRepoImpl implements BlogsRepo {
  final  Blogsremote remote;

  BlogsRepoImpl(this.remote);

  @override
  Future<List<AllBlogsModel>> getAllBlogs() {
    return remote.getAllBlogs();
  }
}