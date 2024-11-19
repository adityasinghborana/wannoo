import 'package:wannoo/categories/datalayer/service/remote.dart';

import '../model/response/categoriesresponse.dart';

abstract class  AllCategoriesRepo {
  Future<List<Category>>  getAllCategories();
}

@override
class AllCategoriesRepoImpl implements AllCategoriesRepo {
  final  AllCategoriesRemote remote;

  AllCategoriesRepoImpl(this.remote);

  @override
  Future<List<Category>>  getAllCategories() {
    return remote.getAllCategories();
  }
}