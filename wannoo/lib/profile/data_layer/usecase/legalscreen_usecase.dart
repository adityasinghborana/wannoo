import 'package:wannoo/profile/data_layer/model/response/legal_screen_response_model.dart';
import 'package:wannoo/profile/data_layer/repo/legal_repo.dart';

class LegalScreenUseCase {
  final LegalRepo repository;

  LegalScreenUseCase(this.repository);

  Future<LegalScreenResponseModel> execute() {
    return repository.getData();
  }
}
