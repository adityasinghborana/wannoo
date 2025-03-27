import 'package:wannoo/bookings/data_layer/model/request/previous_booking_req.dart';
import 'package:wannoo/bookings/data_layer/model/response/previous_bookings.dart';
import 'package:wannoo/bookings/data_layer/repo/bookings_repo.dart';

class GetUserBookingsUseCase {
  final BookingsRepoImpl repository;

  GetUserBookingsUseCase(this.repository);

  Future<List<PreviousBookings>> execute(PreviousBookingReq data) {
    return repository.getPreviousBookings(data);
  }
}
