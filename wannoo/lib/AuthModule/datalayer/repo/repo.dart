import 'package:wannoo/AuthModule/datalayer/services/remote.dart';

import '../model/request/delete_user_request.dart';
import '../model/response/delete_user_repsonse.dart';

abstract class DeleteUserRepo {
  Future<DeleteUserResponse> deleteUser(DeleteUserRequest uid);
}

@override
class DeleteUserRepoImpl implements DeleteUserRepo {
  final DeleteUser remote;

  DeleteUserRepoImpl(this.remote);

  @override
  Future<DeleteUserResponse> deleteUser(DeleteUserRequest uid) async {
    try {
      return await remote.deleteUser(uid);
    } catch (e) {
      print("Error deleting user: $e");
      return const DeleteUserResponse(message: "Failed to delete user");
    }
  }
}
