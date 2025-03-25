import 'package:wannoo/homepage/datalayer/model/response/alltours.dart';

import '../repository/alltours.dart';

class GetAllToursUseCase {
  final AlltoursRepository repository;

  GetAllToursUseCase(this.repository);

  Future<List<ALLTours>> execute() {
    return repository.gettours();
  }
}