import 'package:flutter/foundation.dart';

import '../model/request/intent_request.dart';
import '../model/response/intent_response.dart';
import '../service/remote.dart';

abstract class StripeIntentRepository {
  Future<IntentResponse> getIntent(IntentRequest requestBody);
}

class StripeIntentRepositoryImpl implements StripeIntentRepository {
  final StripeRemoteService remoteService;

  StripeIntentRepositoryImpl(this.remoteService);

  @override
  Future<IntentResponse> getIntent(IntentRequest requestBody) async {
    try {
      IntentResponse response = await remoteService.getIntent(requestBody);
      return response;
    } catch (error) {
      // Handle any errors that might occur during the process
      debugPrint("Error get intent: $error");
      rethrow; // Rethrow the error to let the caller handle it
    }
  }
}
