import 'package:wannoo/itinarary/datalayer/model/request/create_itinarary_request.dart';
import 'package:wannoo/itinarary/datalayer/model/response/itinarary_model.dart';

import '../repository/itinarary_repository.dart';

class CreateItinararyUseCase {
  final ItinararyRepo repository;

  CreateItinararyUseCase(this.repository);

  Future<ItinararyModel> execute(CreateItinararyRequest data) {
    return repository.createItinarary(data);
  }
}
