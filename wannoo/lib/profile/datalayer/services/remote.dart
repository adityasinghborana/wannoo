import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../Constants.dart';
import '../model/response/contact_us_response.dart';

part 'remote.g.dart';

@RestApi(baseUrl: baseurl)
abstract class ContactUsRemote {
  factory ContactUsRemote(Dio dio, {String? baseUrl}) =
  _ContactUsRemote;

  @GET('/contactusdata')
  Future<ContactUsResponse> getContactUsData();
}
