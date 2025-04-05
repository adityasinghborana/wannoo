import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:wannoo/components/experiences_list_view.dart';
import 'package:wannoo/components/previous_booking_card.dart';
import 'package:wannoo/bookings/presentation_layer/previousbookings_controller.dart';

class PreviousBookings extends StatefulWidget {
  const PreviousBookings({super.key});

  @override
  State<PreviousBookings> createState() => _PreviousBookingsState();
}

class _PreviousBookingsState extends State<PreviousBookings> {
  final _controller = ScrollController();
  var _offset = 0.0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() => setState(() => _offset = _controller.offset));
  }

  @override
  Widget build(BuildContext context) {
    final PreviousBookingsController previousBookingsController =
        Get.put(PreviousBookingsController());
    return Scaffold(
      body: Obx(
        () {
          return CustomScrollView(
            controller: _controller,
            slivers: [
              const SliverAppBar(
                title: Text('Bookings'),
                centerTitle: true,
                pinned: true,
              ),
              if (previousBookingsController.previousBookings.isNotEmpty)
                SliverList.builder(
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
              else
                SliverList.list(
                  children: [
                    Opacity(
                      opacity: 1 - min(1, _offset / 180),
                      child: Container(
                        padding: const EdgeInsets.all(32),
                        width: double.infinity,
                        height: 240,
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
                    ListTile(
                      contentPadding: const EdgeInsets.all(16),
                      title: const Text('Most Visited'),
                      titleTextStyle: Theme.of(context).textTheme.titleLarge,
                    ),
                    ExperiencesListview(
                      filterProperty: 'Festivals',
                      isFilteredList: false,
                    ),
                    ListTile(
                      contentPadding: const EdgeInsets.all(16),
                      title: const Text('Recommended tours'),
                      titleTextStyle: Theme.of(context).textTheme.titleLarge,
                    ),
                    ExperiencesListview(
                      filterProperty: 'Trek',
                      isFilteredList: false,
                    ),
                    ListTile(
                      contentPadding: const EdgeInsets.all(16),
                      title: const Text('Recommended tours'),
                      titleTextStyle: Theme.of(context).textTheme.titleLarge,
                    ),
                    ExperiencesListview(
                      filterProperty: 'Trek',
                      isFilteredList: false,
                    ),
                  ],
                ),
            ],
          );
        },
      ),
    );
  }
}
