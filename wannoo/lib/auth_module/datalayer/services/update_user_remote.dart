import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:wannoo/auth_module/datalayer/model/request/update_user_model.dart';

import '../../../constants.dart';
import '../model/response/update_user_response.dart';
part 'update_user_remote.g.dart';

@RestApi(baseUrl: baseurl)
abstract class UpdateUserRemote {
  factory UpdateUserRemote(Dio dio, {String? baseUrl}) = _UpdateUserRemote;

  @PUT('/updateuser')
  Future<UpdateUserResponse> updateUser(@Body() UpdateUserModel reqBody);
}
