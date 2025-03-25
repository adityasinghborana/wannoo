import 'package:wannoo/itinarary/datalayer/model/request/delete_user_fav_tour_request.dart';
import 'package:wannoo/itinarary/datalayer/model/response/delete_user_fav_tour_response.dart';

import '../model/response/delete_itinarary_response.dart';
import '../repository/itinarary_repository.dart';

class DeleteFavTourUseCase {
  final itinararyRepo repository;

  DeleteFavTourUseCase(this.repository);

  Future<DeleteUserFavTourResponse> execute(DeleteUserFavTourRequest data) {
    return repository.deleteFavTour(data);
  }
}
