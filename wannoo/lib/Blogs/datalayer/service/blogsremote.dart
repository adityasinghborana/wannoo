import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../Constants.dart';
import '../model/response/all_blogs_model.dart';
part 'blogsremote.g.dart';

@RestApi(baseUrl: baseurl)
abstract class Blogsremote {
  factory Blogsremote(Dio dio, {String? baseUrl}) = _Blogsremote;

  @GET('/blogs')
  Future<List<AllBlogsModel>> getAllBlogs();
}
