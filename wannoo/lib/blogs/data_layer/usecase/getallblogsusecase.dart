import 'package:wannoo/blogs/data_layer/model/response/all_blogs_model.dart';
import 'package:wannoo/blogs/data_layer/repository/blogs_repository.dart';

class GetAllBlogsUseCase {
  final BlogsRepo repository;

  GetAllBlogsUseCase(this.repository);

  Future<List<AllBlogsModel>> execute() {
    return repository.getAllBlogs();
  }
}
