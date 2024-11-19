import 'package:wannoo/Blogs/datalayer/model/response/all_blogs_model.dart';
import 'package:wannoo/Blogs/datalayer/repository/blogsrepository.dart';

class GetAllBlogsUseCase {
  final BlogsRepo repository;

  GetAllBlogsUseCase(this.repository);

  Future<List<AllBlogsModel>> execute() {
    return repository.getAllBlogs();
  }
}