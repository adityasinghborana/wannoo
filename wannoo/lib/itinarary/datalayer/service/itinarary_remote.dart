import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:wannoo/Constants.dart';
import 'package:wannoo/homepage/datalayer/model/response/alltours.dart';
import 'package:wannoo/itinarary/datalayer/model/request/create_itinarary_request.dart';

import '../model/response/itinarary_model.dart';

part 'itinarary_remote.g.dart';

@RestApi(baseUrl: baseurl)
abstract class itinararyRemote {
  factory itinararyRemote(Dio dio, {String? baseUrl}) = _itinararyRemote;

  @GET('/itinarary')
  Future<List<ItinararyModel>> getData();
  @POST('/createitinarary')
  Future<ItinararyModel> createData(@Body() CreateItinararyRequest data);
  @GET('/favtours')
  Future<List<ALLTours>> getFavTours();
}
