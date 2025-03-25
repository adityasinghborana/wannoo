import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:wannoo/AuthModule/datalayer/model/request/delete_user_request.dart';
import 'package:wannoo/constants.dart';

import '../model/response/delete_user_repsonse.dart';
part 'remote.g.dart';

@RestApi(baseUrl: baseurl)
abstract class DeleteUser {
  factory DeleteUser(Dio dio, {String? baseUrl}) = _DeleteUser;

  @DELETE('/deleteuser')
  Future<DeleteUserResponse> deleteUser(@Body() DeleteUserRequest uid);
}
