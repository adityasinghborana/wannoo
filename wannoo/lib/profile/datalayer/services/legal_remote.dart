import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:wannoo/profile/datalayer/model/response/legal_screen_response_model.dart';
import '../../../Constants.dart';

part 'legal_remote.g.dart';

@RestApi(baseUrl: baseurl)
abstract class LegalRemote {
  factory LegalRemote(Dio dio, {String? baseUrl}) = _LegalRemote;

  @GET('/Policy')
  Future<LegalScreenResponseModel> getData();
}
