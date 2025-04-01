import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:wannoo/bookings/data_layer/model/request/booking_request.dart';

import '../../../constants.dart';
import '../model/request/intent_request.dart';
import '../model/response/booking_response.dart';
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
  @POST('/bookings')
  Future<BookingResponse> createBooking(
    @Body() BookingRequest requestBody,
  );
}
