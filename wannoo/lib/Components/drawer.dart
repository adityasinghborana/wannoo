import 'package:flutter/material.dart';

Widget drawer() {
  return Drawer(
    backgroundColor: Colors.white,
    child: ListView(
      padding: const EdgeInsets.all(8),
      children: [
        Image.asset("/assets/images/logo.png"),
        ListTile(
          title: const Text('Home'),
          onTap: () {
            null;
          },
        ),
        ListTile(
          title: const Text('Experiences'),
          onTap: () {
            // Navigate to another page when item is clicked
            null;
          },
        ),
        // ListTile(
        //   title: Text('Contact Us'),
        //   onTap: () {
        //     Get.to(Contactus());
        //   },
        // ),
        ListTile(
          title: const Text('Cart'),
          onTap: () {
            null;
          },
        ),
        ListTile(
          title: const Text('Dashboard'),
          onTap: () {
            null;
          },
        ),
      ],
    ),
  );
}
