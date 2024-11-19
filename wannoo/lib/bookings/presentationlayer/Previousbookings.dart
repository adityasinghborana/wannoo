import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:wannoo/Components/EmptyState.dart';

class PreviousBookings extends StatelessWidget {
  const PreviousBookings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Previous Bookings "),
      ),
      body: Center(
        child: dataNotFound(width: Get.width, height: 300.00),
      ),
    );
  }
}
