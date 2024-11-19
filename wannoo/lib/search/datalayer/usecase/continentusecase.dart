import 'package:wannoo/search/datalayer/model/response/continentsreponse.dart';
import 'package:wannoo/search/datalayer/repository/repository.dart';

class GetAllContinentsUseCase {
  final ContinentRepo repository;

  GetAllContinentsUseCase(this.repository);

  Future<List<AllContinents>> execute() {
    return repository.getAllContinents();
  }
}