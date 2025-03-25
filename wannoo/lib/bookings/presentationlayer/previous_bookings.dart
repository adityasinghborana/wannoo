import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:wannoo/Components/empty_state.dart';
import 'package:wannoo/Components/previous_booking_card.dart';
import 'package:wannoo/bookings/presentationlayer/previousbookings_controller.dart';

class PreviousBookings extends StatelessWidget {
  const PreviousBookings({super.key});

  @override
  Widget build(BuildContext context) {
    final PreviousBookingsController previousBookingsController =
        Get.put(PreviousBookingsController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Previous Bookings "),
      ),
      body: Obx(() {
        return Center(
            child: previousBookingsController.previousBookings.isEmpty
                ? dataNotFound(width: Get.width, height: 300.00)
                : ListView.builder(
                    itemCount:
                        previousBookingsController.previousBookings.length,
                    itemBuilder: (_, int index) {
                      var data =
                          previousBookingsController.previousBookings[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: PreviousBookingCard(
                          title: data.status ?? "",
                          amount: data.serviceTotal ?? 0.0,
                          subInfoText: '${data.tourDate}',
                          passengers: data.passengers.toString(),
                          bookedat: data.createdAt.toString().substring(0, 10),
                          tourname: data.tour?.tourName ?? "",
                        ),
                      );
                    }));
      }),
    );
  }
}
