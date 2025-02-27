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
        child: Icon(
          Icons.calendar_month_rounded,
          color: Colors.white,
        ),
        backgroundColor: Colors.orange,
        radius: 25,
      ),
      required this.subInfoText,
      this.subInfoTitle = "Tour Date ",
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.05),
              offset: Offset(0, 10),
              blurRadius: 0,
              spreadRadius: 0,
            )
          ],
          gradient: RadialGradient(
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
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold),
              ),
              Container(
                width: 75,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.0),
                  gradient: LinearGradient(
                      colors: [Colors.white, Colors.white],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter),
                ),
                child: Center(
                    child: Text(
                  "\$$amount",
                  style: TextStyle(color: Colors.orange),
                )),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Passengers $passengers",
                style: TextStyle(
                    color: Colors.white.withOpacity(.75), fontSize: 14),
              ),
              Text(
                "Booked At $bookedat",
                style: TextStyle(
                    color: Colors.white.withOpacity(.75), fontSize: 14),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Tour Name $tourname",
                style: TextStyle(
                    color: Colors.white.withOpacity(.75), fontSize: 14),
              ),
            ],
          ),
          SizedBox(height: 15),
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
                  SizedBox(width: 10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(subInfoTitle),
                      Text(
                        subInfoText,
                        style: TextStyle(
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
