import '../model/request/user_itinarary_request.dart';
import '../model/response/itinarary_model.dart';
import '../repository/itinarary_repository.dart';

class GetitinararyUseCase {
  final ItinararyRepo repository;

  GetitinararyUseCase(this.repository);

  Future<List<ItinararyModel>> execute(UserItinararyRequest uid) {
    return repository.function(uid);
  }
}
