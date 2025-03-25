import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:wannoo/bookings/datalayer/model/request/booking_request.dart';
import 'package:wannoo/bookings/datalayer/model/request/previous_booking_req.dart';
import 'package:wannoo/bookings/datalayer/model/response/previous_bookings.dart';
import '../../../constants.dart';
import '../model/response/booking_response.dart';

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
