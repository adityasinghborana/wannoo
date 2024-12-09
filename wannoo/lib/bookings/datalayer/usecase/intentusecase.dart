import '../model/request/intent_request.dart';
import '../model/response/intent_response.dart';
import '../repo/intent_repo.dart';

class IntentUseCase {
  final StripeIntentRepository repository;

  IntentUseCase(this.repository);

  Future<IntentResponse> execute(IntentRequest data) {
    return repository.getIntent(data);
  }
}
