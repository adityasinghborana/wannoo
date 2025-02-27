import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:wannoo/bookings/datalayer/model/request/previousBooking_req.dart';
import 'package:wannoo/bookings/datalayer/model/response/previous_bookings.dart';

import '../datalayer/repo/bookings_repo.dart';
import '../datalayer/service/bookings_remote.dart';
import '../datalayer/usecase/userbookings.dart';

class PreviousBookingsController extends GetxController {
  @override
  void onInit() {
    getBookings();
    super.onInit();
  }

  GetUserBookingsUseCase getUserBookingsUseCase =
      GetUserBookingsUseCase(BookingsRepoImpl(BookingsRemote(Dio())));
  RxList<PreviousBookings> previousBookings = <PreviousBookings>[].obs;

  Future<void> getBookings() async {
    try {
      await getUserBookingsUseCase
          .execute(PreviousbookingReq(id: "123456789"))
          .then((response) {
        previousBookings.assignAll(response);
      });
    } catch (e) {
      print(e);
    }
  }
}
