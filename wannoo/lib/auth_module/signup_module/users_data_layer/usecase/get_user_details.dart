import '../model/response/user_detail_response.dart';
import '../repository/user_repository.dart';

class GetUserDetailsUseCase {
  final UserRepository repository;

  GetUserDetailsUseCase(this.repository);

  Future<List<UserDetail>> execute(String uid) {
    return repository.getUserDetail(uid);
  }
}
