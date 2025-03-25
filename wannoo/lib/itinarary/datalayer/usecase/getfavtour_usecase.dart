import 'package:wannoo/homepage/datalayer/model/response/alltours.dart';
import 'package:wannoo/itinarary/datalayer/model/request/favtourrequest.dart';

import '../repository/itinarary_repository.dart';

class GetFavToursUseCase {
  final ItinararyRepo repository;

  GetFavToursUseCase(this.repository);

  Future<List<ALLTours>> execute(FavTourRequest data) {
    return repository.getFavTours(data);
  }
}
