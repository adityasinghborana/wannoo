import 'package:wannoo/profile/datalayer/model/response/contact_us_response.dart';
import 'package:wannoo/profile/datalayer/services/remote.dart';

abstract class ContactUsRepo{
  Future<ContactUsResponse> getContactUsData();
}

class ContactUsRepoImpl implements ContactUsRepo{
  final ContactUsRemote remote ;

  ContactUsRepoImpl(this.remote);

  @override
  Future<ContactUsResponse> getContactUsData() async {
    return await remote.getContactUsData();
  }
}