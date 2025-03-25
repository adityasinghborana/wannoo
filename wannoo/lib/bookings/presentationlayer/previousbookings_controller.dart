import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:wannoo/bookings/datalayer/model/request/previous_booking_req.dart';
import 'package:wannoo/bookings/datalayer/model/response/previous_bookings.dart';
import 'package:wannoo/utilities/auth_class.dart';

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
      var uid = await getUserUID();
      await getUserBookingsUseCase
          .execute(PreviousBookingReq(id: uid ?? ""))
          .then((response) {
        debugPrint("hello uid $uid");
        previousBookings.assignAll(response);
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
