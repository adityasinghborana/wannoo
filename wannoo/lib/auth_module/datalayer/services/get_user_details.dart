import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:wannoo/auth_module/signup_module/users_data_layer/model/response/user_detail_response.dart';

import '../../../constants.dart';
part 'get_user_details.g.dart';

@RestApi(baseUrl: baseurl)
abstract class UserDetailsRemote {
  factory UserDetailsRemote(Dio dio, {String? baseUrl}) = _UserDetailsRemote;

  @GET('/checkuser')
  Future<UserDetail> getUserDetails({
    @Query('uid', encoded: false)
    required String uid, // Use @Path for path parameter
  });
}
