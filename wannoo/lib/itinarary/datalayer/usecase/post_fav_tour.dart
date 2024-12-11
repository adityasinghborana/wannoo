import 'package:wannoo/itinarary/datalayer/model/request/post_fav_tour.dart';
import 'package:wannoo/itinarary/datalayer/model/response/post_fav_tour_response.dart';
import 'package:wannoo/itinarary/datalayer/repository/itinarary_repository.dart';

class PostFavUseCase {
  final itinararyRepo repository;

  PostFavUseCase(this.repository);

  Future<PostFavTourResponse> execute(PostFavTourRequest data) {
    return repository.addFavTour(data);
  }
}
