import 'package:wannoo/auth_module/datalayer/model/request/delete_user_request.dart';
import 'package:wannoo/auth_module/datalayer/model/response/delete_user_repsonse.dart';
import 'package:wannoo/auth_module/datalayer/repo/repo.dart';

class DeleteUserUseCase {
  final DeleteUserRepoImpl repository;

  DeleteUserUseCase(this.repository);

  Future<DeleteUserResponse> execute(DeleteUserRequest uid) {
    return repository.deleteUser(uid);
  }
}
