import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:wannoo/constants.dart';
import 'package:wannoo/homepage/data_layer/model/response/alltours.dart';
import 'package:wannoo/itinarary/data_layer/model/request/create_itinarary_request.dart';
import 'package:wannoo/itinarary/data_layer/model/request/delete_itinarary_request.dart';
import 'package:wannoo/itinarary/data_layer/model/request/delete_user_fav_tour_request.dart';
import 'package:wannoo/itinarary/data_layer/model/request/post_fav_tour.dart';
import 'package:wannoo/itinarary/data_layer/model/request/user_itinarary_request.dart';
import 'package:wannoo/itinarary/data_layer/model/response/delete_itinarary_response.dart';
import 'package:wannoo/itinarary/data_layer/model/response/delete_user_fav_tour_response.dart';
import 'package:wannoo/itinarary/data_layer/model/response/post_fav_tour_response.dart';

import '../model/response/itinarary_model.dart';

part 'itinarary_remote.g.dart';

@RestApi(baseUrl: baseurl)
abstract class ItinararyRemote {
  factory ItinararyRemote(Dio dio, {String? baseUrl}) = _ItinararyRemote;

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
