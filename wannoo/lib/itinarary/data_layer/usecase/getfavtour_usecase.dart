import 'package:wannoo/homepage/data_layer/model/response/alltours.dart';
import 'package:wannoo/itinarary/data_layer/model/request/favtourrequest.dart';

import '../repository/itinarary_repository.dart';

class GetFavToursUseCase {
  final ItinararyRepo repository;

  GetFavToursUseCase(this.repository);

  Future<List<ALLTours>> execute(FavTourRequest data) {
    return repository.getFavTours(data);
  }
}
