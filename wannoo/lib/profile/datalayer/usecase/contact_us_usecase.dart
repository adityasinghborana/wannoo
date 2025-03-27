import 'package:wannoo/profile/datalayer/repo/contact_us_repo.dart';

import '../model/response/contact_us_response.dart';

class GetContactUsUsecase {
  final ContactUsRepo repository;

  GetContactUsUsecase(this.repository);

  Future<ContactUsResponse> execute() {
    return repository.getContactUsData();
  }
}
