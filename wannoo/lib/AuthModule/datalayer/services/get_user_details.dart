import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:wannoo/AuthModule/SignupModule/usersdatalayer/model/response/user_detail_response.dart';

import '../../../Constants.dart';
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
