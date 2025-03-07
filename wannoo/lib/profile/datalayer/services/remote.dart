import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:wannoo/profile/datalayer/model/request/form_request.dart';
import '../../../Constants.dart';
import '../model/response/contact_us_response.dart';
import '../model/response/form_response.dart';

part 'remote.g.dart';

@RestApi(baseUrl: baseurl)
abstract class ContactUsRemote {
  factory ContactUsRemote(Dio dio, {String? baseUrl}) = _ContactUsRemote;

  @GET('/contactusdata')
  Future<ContactUsResponse> getContactUsData();

  @POST('/submitform')
  Future<FormResponse> sendForm(@Body() FormRequest req);
}
