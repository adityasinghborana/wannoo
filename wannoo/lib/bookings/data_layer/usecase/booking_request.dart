import 'package:wannoo/bookings/data_layer/model/request/booking_request.dart';
import 'package:wannoo/bookings/data_layer/model/response/booking_response.dart';
import 'package:wannoo/bookings/data_layer/repo/bookings_repo.dart';

class CreateBookingUseCase {
  final BookingsRepo repository;

  CreateBookingUseCase(this.repository);

  Future<BookingResponse> execute(BookingRequest data) {
    return repository.createBookings(data);
  }
}
