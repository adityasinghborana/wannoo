import '../model/request/create_user_request.dart';
import '../model/response/create_user_response.dart';
import '../repository/user_repository.dart';

class CreateUserUseCase {
  final UserRepository repository;

  CreateUserUseCase(this.repository);

  Future<UserModelResponse> execute(UserModel data) {
    return repository.createusers(data);
  }
}
