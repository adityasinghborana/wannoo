import 'package:wannoo/blogs/data_layer/service/blogsremote.dart';

import '../../../blogs/data_layer/model/response/all_blogs_model.dart';

abstract class BlogsRepo {
  Future<List<AllBlogsModel>> getAllBlogs();
}

@override
class BlogsRepoImpl implements BlogsRepo {
  final Blogsremote remote;

  BlogsRepoImpl(this.remote);

  @override
  Future<List<AllBlogsModel>> getAllBlogs() {
    return remote.getAllBlogs();
  }
}
