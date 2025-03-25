import 'package:wannoo/homepage/datalayer/model/response/alltours.dart';
import 'package:wannoo/itinarary/datalayer/model/request/create_itinarary_request.dart';
import 'package:wannoo/itinarary/datalayer/model/request/delete_itinarary_request.dart';
import 'package:wannoo/itinarary/datalayer/model/request/delete_user_fav_tour_request.dart';
import 'package:wannoo/itinarary/datalayer/model/request/favtourrequest.dart';
import 'package:wannoo/itinarary/datalayer/model/request/post_fav_tour.dart';
import 'package:wannoo/itinarary/datalayer/model/request/user_itinarary_request.dart';
import 'package:wannoo/itinarary/datalayer/model/response/delete_itinarary_response.dart';
import 'package:wannoo/itinarary/datalayer/model/response/delete_user_fav_tour_response.dart';
import 'package:wannoo/itinarary/datalayer/model/response/post_fav_tour_response.dart';

import '../model/response/itinarary_model.dart';
import '../service/itinarary_remote.dart';

abstract class ItinararyRepo {
  Future<List<ItinararyModel>> function(UserItinararyRequest id);
  Future<ItinararyModel> createItinarary(CreateItinararyRequest data);
  Future<List<ALLTours>> getFavTours(FavTourRequest data);
  Future<PostFavTourResponse> addFavTour(PostFavTourRequest data);
  Future<DeleteItinararyResponse> deleteItinarary(DeleteItinararyRequest data);
  Future<DeleteUserFavTourResponse> deleteFavTour(
      DeleteUserFavTourRequest data);
}

@override
class ItinararyRepoImpl implements ItinararyRepo {
  final ItinararyRemote remote;

  ItinararyRepoImpl(this.remote);

  @override
  Future<List<ItinararyModel>> function(UserItinararyRequest id) {
    return remote.getData(id);
  }

  @override
  Future<ItinararyModel> createItinarary(CreateItinararyRequest data) {
    return remote.createData(data);
  }

  @override
  Future<List<ALLTours>> getFavTours(FavTourRequest data) {
    return remote.getFavTours(id: data.id.toString());
  }

  @override
  Future<PostFavTourResponse> addFavTour(PostFavTourRequest data) {
    return remote.addFavTour(data);
  }

  @override
  Future<DeleteUserFavTourResponse> deleteFavTour(
      DeleteUserFavTourRequest data) {
    return remote.deleteFavTour(data);
  }

  @override
  Future<DeleteItinararyResponse> deleteItinarary(DeleteItinararyRequest data) {
    return remote.deleteItinarary(data);
  }
}
