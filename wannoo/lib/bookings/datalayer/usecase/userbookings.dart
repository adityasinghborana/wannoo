import 'package:wannoo/bookings/datalayer/model/request/previousBooking_req.dart';
import 'package:wannoo/bookings/datalayer/model/response/previous_bookings.dart';
import 'package:wannoo/bookings/datalayer/repo/bookings_repo.dart';

class GetUserBookingsUseCase {
  final BookingsRepoImpl repository;

  GetUserBookingsUseCase(this.repository);

  Future<List<PreviousBookings>> execute(PreviousbookingReq data) {
    return repository.getPreviousBookings(data);
  }
}
