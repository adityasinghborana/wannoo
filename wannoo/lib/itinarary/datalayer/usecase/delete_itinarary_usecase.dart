import 'package:wannoo/itinarary/datalayer/model/request/delete_itinarary_request.dart';
import 'package:wannoo/itinarary/datalayer/model/response/delete_itinarary_response.dart';

import '../repository/itinarary_repository.dart';

class DeleteItinararyUseCase {
  final itinararyRepo repository;

  DeleteItinararyUseCase(this.repository);

  Future<DeleteItinararyResponse> execute(DeleteItinararyRequest data) {
    return repository.deleteItinarary(data);
  }
}
