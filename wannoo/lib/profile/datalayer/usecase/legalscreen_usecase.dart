import 'package:wannoo/profile/datalayer/model/response/legal_screen_response_model.dart';
import 'package:wannoo/profile/datalayer/repo/legal_repo.dart';

class LegalScreenUseCase {
  final LegalRepo repository;

  LegalScreenUseCase(this.repository);

  Future<LegalScreenResponseModel> execute() {
    return repository.getData();
  }
}
