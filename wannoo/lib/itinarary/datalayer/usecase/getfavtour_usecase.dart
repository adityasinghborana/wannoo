import 'package:wannoo/homepage/datalayer/model/response/alltours.dart';

import '../repository/itinarary_repository.dart';

class GetFavToursUseCase {
  final itinararyRepo repository;

  GetFavToursUseCase(this.repository);

  Future<List<ALLTours>> execute() {
    return repository.getFavTours();
  }
}
