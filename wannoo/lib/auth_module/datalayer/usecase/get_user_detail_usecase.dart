import 'package:wannoo/auth_module/signup_module/users_data_layer/model/response/user_detail_response.dart';
import 'package:wannoo/auth_module/datalayer/repo/userdeatils_repo.dart';

class GetUserDetailUseCase {
  final UserDetailsRepo repository;

  GetUserDetailUseCase(this.repository);

  Future<UserDetail> execute(String uid) {
    return repository.getUserDetails(uid);
  }
}
