import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:wannoo/Constants.dart';
import 'package:wannoo/homepage/datalayer/model/response/alltours.dart';
import 'package:wannoo/itinarary/datalayer/model/request/create_itinarary_request.dart';
import 'package:wannoo/itinarary/datalayer/model/request/delete_itinarary_request.dart';
import 'package:wannoo/itinarary/datalayer/model/request/delete_user_fav_tour_request.dart';
import 'package:wannoo/itinarary/datalayer/model/request/post_fav_tour.dart';
import 'package:wannoo/itinarary/datalayer/model/request/user_itinarary_request.dart';
import 'package:wannoo/itinarary/datalayer/model/response/delete_itinarary_response.dart';
import 'package:wannoo/itinarary/datalayer/model/response/delete_user_fav_tour_response.dart';
import 'package:wannoo/itinarary/datalayer/model/response/post_fav_tour_response.dart';

import '../model/response/itinarary_model.dart';

part 'itinarary_remote.g.dart';

@RestApi(baseUrl: baseurl)
abstract class itinararyRemote {
  factory itinararyRemote(Dio dio, {String? baseUrl}) = _itinararyRemote;

  @POST('/itinarary')
  Future<List<ItinararyModel>> getData(@Body() UserItinararyRequest uid);
  @POST('/createitinarary')
  Future<ItinararyModel> createData(@Body() CreateItinararyRequest data);

  @GET('/favtours')
  Future<List<ALLTours>> getFavTours({
    @Query('id', encoded: false)
    required String id, // Use @Path for path parameter
  });
  @POST('/addfavtours')
  Future<PostFavTourResponse> addFavTour(@Body() PostFavTourRequest data);
  @DELETE('/deleteitinarary')
  Future<DeleteItinararyResponse> deleteItinarary(
      @Body() DeleteItinararyRequest data);

  @DELETE('/deletefavtours')
  Future<DeleteUserFavTourResponse> deleteFavTour(
      @Body() DeleteUserFavTourRequest data);
}
