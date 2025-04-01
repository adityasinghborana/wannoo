import 'package:wannoo/itinarary/data_layer/model/request/post_fav_tour.dart';
import 'package:wannoo/itinarary/data_layer/model/response/post_fav_tour_response.dart';
import 'package:wannoo/itinarary/data_layer/repository/itinarary_repository.dart';

class PostFavUseCase {
  final ItinararyRepo repository;

  PostFavUseCase(this.repository);

  Future<PostFavTourResponse> execute(PostFavTourRequest data) {
    return repository.addFavTour(data);
  }
}
