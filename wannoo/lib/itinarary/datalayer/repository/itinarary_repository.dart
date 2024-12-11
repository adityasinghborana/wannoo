import 'package:wannoo/homepage/datalayer/model/response/alltours.dart';
import 'package:wannoo/itinarary/datalayer/model/request/create_itinarary_request.dart';
import 'package:wannoo/itinarary/datalayer/model/request/favtourrequest.dart';
import 'package:wannoo/itinarary/datalayer/model/request/post_fav_tour.dart';
import 'package:wannoo/itinarary/datalayer/model/response/post_fav_tour_response.dart';

import '../model/response/itinarary_model.dart';
import '../service/itinarary_remote.dart';

abstract class itinararyRepo {
  Future<List<ItinararyModel>> function();
  Future<ItinararyModel> createItinarary(CreateItinararyRequest data);
  Future<List<ALLTours>> getFavTours(FavTourRequest data);
  Future<PostFavTourResponse> addFavTour(PostFavTourRequest data);
}

@override
class itinararyRepoImpl implements itinararyRepo {
  final itinararyRemote remote;

  itinararyRepoImpl(this.remote);

  @override
  Future<List<ItinararyModel>> function() {
    return remote.getData();
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
}
