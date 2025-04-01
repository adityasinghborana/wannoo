import 'package:wannoo/profile/data_layer/model/request/form_request.dart';
import 'package:wannoo/profile/data_layer/model/response/form_response.dart';
import 'package:wannoo/profile/data_layer/repo/contact_us_repo.dart';

class SendFormUseCase {
  final ContactUsRepo repository;

  SendFormUseCase(this.repository);

  Future<FormResponse> execute(FormRequest data) {
    return repository.sendFormData(data);
  }
}
