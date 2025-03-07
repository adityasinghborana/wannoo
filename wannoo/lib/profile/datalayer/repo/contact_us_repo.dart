import 'package:wannoo/profile/datalayer/model/request/form_request.dart';
import 'package:wannoo/profile/datalayer/model/response/contact_us_response.dart';
import 'package:wannoo/profile/datalayer/model/response/form_response.dart';
import 'package:wannoo/profile/datalayer/services/remote.dart';

abstract class ContactUsRepo {
  Future<ContactUsResponse> getContactUsData();
  Future<FormResponse> sendFormData(FormRequest req);
}

class ContactUsRepoImpl implements ContactUsRepo {
  final ContactUsRemote remote;

  ContactUsRepoImpl(this.remote);

  @override
  Future<ContactUsResponse> getContactUsData() async {
    return await remote.getContactUsData();
  }

  @override
  Future<FormResponse> sendFormData(FormRequest req) async {
    return await remote.sendForm(req);
  }
}
