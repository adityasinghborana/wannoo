import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:wannoo/bookings/data_layer/model/request/booking_request.dart';
import 'package:wannoo/bookings/data_layer/model/request/previous_booking_req.dart';
import 'package:wannoo/bookings/data_layer/model/response/booking_response.dart';
import 'package:wannoo/bookings/data_layer/model/response/previous_bookings.dart';
import 'package:wannoo/constants.dart';

part 'bookings_remote.g.dart';

@RestApi(baseUrl: baseurl)
abstract class BookingsRemote {
  factory BookingsRemote(Dio dio, {String? baseUrl}) = _BookingsRemote;

  @POST('/bookings')
  Future<BookingResponse> createBooking(
    @Body() BookingRequest requestBody,
  );
  @POST('/userbookings')
  Future<List<PreviousBookings>> getUserBooking(
    @Body() PreviousBookingReq requestBody,
  );
}
