import 'package:flutter/foundation.dart';
import 'package:wannoo/bookings/datalayer/model/request/booking_request.dart';
import 'package:wannoo/bookings/datalayer/model/request/previous_booking_req.dart';
import 'package:wannoo/bookings/datalayer/model/response/previous_bookings.dart';
import 'package:wannoo/bookings/datalayer/service/bookings_remote.dart';

import '../model/response/booking_response.dart';

abstract class BookingsRepo {
  Future<BookingResponse> createBookings(BookingRequest data);
  Future<List<PreviousBookings>> getPreviousBookings(PreviousBookingReq data);
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
  Future<List<PreviousBookings>> getPreviousBookings(PreviousBookingReq data) {
    try {
      return remote.getUserBooking(data);
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
