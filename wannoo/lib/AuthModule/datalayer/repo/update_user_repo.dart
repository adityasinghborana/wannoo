import 'package:wannoo/AuthModule/datalayer/model/request/update_user_model.dart';
import 'package:wannoo/AuthModule/datalayer/services/update_user_remote.dart';

import '../model/response/update_user_response.dart';

abstract class UpdateUserRepo {
  Future<UpdateUserResponse> updateUser(UpdateUserModel data);
}

class UpdateUserRepoImpl implements UpdateUserRepo {
  final UpdateUserRemote remote;
  UpdateUserRepoImpl(this.remote);
  @override
  Future<UpdateUserResponse> updateUser(UpdateUserModel data) {
    return remote.updateUser(data);
  }
}
