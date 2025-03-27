import 'package:wannoo/itinarary/data_layer/model/request/delete_itinarary_request.dart';
import 'package:wannoo/itinarary/data_layer/model/response/delete_itinarary_response.dart';

import '../repository/itinarary_repository.dart';

class DeleteItinararyUseCase {
  final ItinararyRepo repository;

  DeleteItinararyUseCase(this.repository);

  Future<DeleteItinararyResponse> execute(DeleteItinararyRequest data) {
    return repository.deleteItinarary(data);
  }
}
