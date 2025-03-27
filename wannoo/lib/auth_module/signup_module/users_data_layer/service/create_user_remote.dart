import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../constants.dart';
import '../model/request/create_user_request.dart';
import '../model/response/create_user_response.dart';
import '../model/response/user_detail_response.dart';
part 'create_user_remote.g.dart';

@RestApi(baseUrl: baseurl)
abstract class CreateUserRemoteService {
  factory CreateUserRemoteService(Dio dio, {String? baseUrl}) =
      _CreateUserRemoteService;

  @POST('/createusers')
  Future<UserModelResponse> createuser(
    @Body() UserModel requestBody,
  );

  @GET('/checkuser')
  Future<List<UserDetail>> getUserDetail(
    @Query('uid') String uid,
  );
}
