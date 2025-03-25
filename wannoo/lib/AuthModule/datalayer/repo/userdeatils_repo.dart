import 'package:wannoo/AuthModule/datalayer/services/get_user_details.dart';

import '../../signup_module/usersdatalayer/model/response/user_detail_response.dart';

abstract class UserDetailsRepo {
  Future<UserDetail> getUserDetails(String uid);
}

@override
class UserDetailsRepoImpl implements UserDetailsRepo {
  final UserDetailsRemote remote;

  UserDetailsRepoImpl(this.remote);

  @override
  Future<UserDetail> getUserDetails(String uid) {
    return remote.getUserDetails(uid: uid);
  }
}
