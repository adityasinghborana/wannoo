import 'package:wannoo/search/data_layer/model/response/continentsreponse.dart';
import 'package:wannoo/search/data_layer/repository/repository.dart';

class GetAllContinentsUseCase {
  final ContinentRepo repository;

  GetAllContinentsUseCase(this.repository);

  Future<List<AllContinents>> execute() {
    return repository.getAllContinents();
  }
}
