import 'package:flutter/material.dart';

class PreviousBookingCard extends StatelessWidget {
  final String title;
  final String passengers;
  final String bookedat;
  final String tourname;

  final String subInfoTitle;
  final String subInfoText;
  final double amount;
  final Widget subIcon;

  const PreviousBookingCard(
      {required this.title,
      required this.passengers,
      required this.tourname,
      required this.bookedat,
      required this.amount,
      this.subIcon = const CircleAvatar(
        backgroundColor: Colors.orange,
        radius: 25,
        child: Icon(
          Icons.calendar_month_rounded,
          color: Colors.white,
        ),
      ),
      required this.subInfoText,
      this.subInfoTitle = "Tour Date ",
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: .05),
              offset: const Offset(0, 10),
              blurRadius: 0,
              spreadRadius: 0,
            )
          ],
          gradient: const RadialGradient(
            colors: [Colors.orangeAccent, Colors.orange],
            focal: Alignment.topCenter,
            radius: .85,
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold),
              ),
              Container(
                width: 75,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.0),
                  gradient: const LinearGradient(
                      colors: [Colors.white, Colors.white],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter),
                ),
                child: Center(
                    child: Text(
                  "\$$amount",
                  style: const TextStyle(color: Colors.orange),
                )),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Passengers $passengers",
                style: TextStyle(
                    color: Colors.white.withValues(alpha: .75), fontSize: 14),
              ),
              Text(
                "Booked At $bookedat",
                style: TextStyle(
                    color: Colors.white.withValues(alpha: .75), fontSize: 14),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Tour Name $tourname",
                style: TextStyle(
                    color: Colors.white.withValues(alpha: .75), fontSize: 14),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Container(
            width: double.infinity,
            height: 75,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  subIcon,
                  const SizedBox(width: 10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(subInfoTitle),
                      Text(
                        subInfoText,
                        style: const TextStyle(
                          color: Colors.orange,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
