import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../Constants.dart';
import '../model/request/intent_request.dart';
import '../model/response/intent_response.dart';

part 'remote.g.dart';

@RestApi(baseUrl: baseurl)
abstract class StripeRemoteService {
  factory StripeRemoteService(Dio dio, {String? baseUrl}) =
      _StripeRemoteService;

  @POST('/create-payment-intent')
  Future<IntentResponse> getIntent(
    @Body() IntentRequest requestBody,
  );
}
