import 'package:wannoo/profile/datalayer/model/request/form_request.dart';
import 'package:wannoo/profile/datalayer/model/response/form_response.dart';
import 'package:wannoo/profile/datalayer/repo/contact_us_repo.dart';

class SendFormUseCase {
  final ContactUsRepo repository;

  SendFormUseCase(this.repository);

  Future<FormResponse> execute(FormRequest data) {
    return repository.sendFormData(data);
  }
}
