import '../model/response/itinarary_model.dart';
import '../repository/itinarary_repository.dart';

class GetitinararyUseCase {
  final itinararyRepo repository;

  GetitinararyUseCase(this.repository);

  Future<List<ItinararyModel>> execute() {
    return repository.function();
  }
}
