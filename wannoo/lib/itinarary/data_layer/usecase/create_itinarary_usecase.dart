import 'package:wannoo/itinarary/data_layer/model/request/create_itinarary_request.dart';
import 'package:wannoo/itinarary/data_layer/model/response/itinarary_model.dart';

import '../repository/itinarary_repository.dart';

class CreateItinararyUseCase {
  final ItinararyRepo repository;

  CreateItinararyUseCase(this.repository);

  Future<ItinararyModel> execute(CreateItinararyRequest data) {
    return repository.createItinarary(data);
  }
}
