import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:wannoo/components/experiences_list_view.dart';
import 'package:wannoo/components/previous_booking_card.dart';
import 'package:wannoo/bookings/presentation_layer/previousbookings_controller.dart';

class PreviousBookings extends StatelessWidget {
  const PreviousBookings({super.key});

  @override
  Widget build(BuildContext context) {
    final PreviousBookingsController previousBookingsController =
        Get.put(PreviousBookingsController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Bookings"),
      ),
      body: Obx(
        () {
          return previousBookingsController.previousBookings.isNotEmpty
              ? ListView.builder(
                  itemCount: previousBookingsController.previousBookings.length,
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
                  },
                )
              : Column(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(32),
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 16,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.ticket,
                              size: 56,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurfaceVariant,
                            ),
                            Text(
                              'No bookings yet\nStart exploring and making memories',
                              style: Theme.of(context).textTheme.bodyLarge,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          ListTile(
                            contentPadding: const EdgeInsets.all(16),
                            title: const Text('Recommended tours'),
                            titleTextStyle:
                                Theme.of(context).textTheme.titleLarge,
                          ),
                          ExperiencesListview(
                            filterProperty: 'Trek',
                            isFilteredList: false,
                          ),
                        ],
                      ),
                    ),
                  ],
                );
        },
      ),
    );
  }
}
