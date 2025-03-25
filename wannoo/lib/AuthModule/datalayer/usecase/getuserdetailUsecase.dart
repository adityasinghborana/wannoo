import 'package:wannoo/AuthModule/SignupModule/usersdatalayer/model/response/user_detail_response.dart';
import 'package:wannoo/AuthModule/datalayer/repo/userdeatils_repo.dart';

class GetUserDetailUseCase {
  final UserDetailsRepo repository;

  GetUserDetailUseCase(this.repository);

  Future<UserDetail> execute(String uid) {
    return repository.getUserDetails(uid);
  }
}
