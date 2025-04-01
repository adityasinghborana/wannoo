import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:wannoo/constants.dart';
import 'package:wannoo/profile/data_layer/model/response/legal_screen_response_model.dart';

part 'legal_remote.g.dart';

@RestApi(baseUrl: baseurl)
abstract class LegalRemote {
  factory LegalRemote(Dio dio, {String? baseUrl}) = _LegalRemote;

  @GET('/Policy')
  Future<LegalScreenResponseModel> getData();
}
