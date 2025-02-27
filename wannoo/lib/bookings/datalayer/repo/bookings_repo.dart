import 'package:wannoo/bookings/datalayer/model/request/booking_request.dart';
import 'package:wannoo/bookings/datalayer/model/request/previousBooking_req.dart';
import 'package:wannoo/bookings/datalayer/model/response/previous_bookings.dart';
import 'package:wannoo/bookings/datalayer/service/bookings_remote.dart';

import '../model/response/booking_response.dart';

abstract class BookingsRepo {
  Future<BookingResponse> createBookings(BookingRequest data);
  Future<List<PreviousBookings>> getPreviousBookings(PreviousbookingReq data);
}

@override
class BookingsRepoImpl implements BookingsRepo {
  final BookingsRemote remote;

  BookingsRepoImpl(this.remote);

  @override
  Future<BookingResponse> createBookings(BookingRequest data) {
    return remote.createBooking(data);
  }

  @override
  Future<List<PreviousBookings>> getPreviousBookings(PreviousbookingReq data) {
    try {
      return remote.getUserBooking(data);
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
