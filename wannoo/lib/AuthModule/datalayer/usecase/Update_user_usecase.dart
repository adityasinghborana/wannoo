import 'package:wannoo/AuthModule/datalayer/model/request/update_user_model.dart';
import 'package:wannoo/AuthModule/datalayer/model/response/update_user_response.dart';
import 'package:wannoo/AuthModule/datalayer/repo/update_user_repo.dart';

class UpdateUserUseCase {
  final UpdateUserRepoImpl repository;

  UpdateUserUseCase(this.repository);

  Future<UpdateUserResponse> execute(UpdateUserModel request) {
    return repository.updateUser(request);
  }
}
