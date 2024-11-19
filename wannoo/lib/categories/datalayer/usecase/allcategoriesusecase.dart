import 'package:wannoo/categories/datalayer/model/response/categoriesresponse.dart';
import 'package:wannoo/categories/datalayer/repository/allcategoriesrepo.dart';

class GetAllCategoriesUseCase {
  final AllCategoriesRepo repository;

  GetAllCategoriesUseCase(this.repository);

  Future<List<Category>>  execute() {
    return repository.getAllCategories();
  }
}