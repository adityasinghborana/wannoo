import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../constants.dart';
import '../model/response/categoriesresponse.dart';
part 'remote.g.dart';

@RestApi(baseUrl: baseurl)
abstract class AllCategoriesRemote {
  factory AllCategoriesRemote(Dio dio, {String? baseUrl}) =
      _AllCategoriesRemote;

  @GET('/tourtypes')
  Future<List<Category>> getAllCategories();
}
