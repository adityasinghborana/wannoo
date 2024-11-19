import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wannoo/routes.dart';

import '../../../Components/large_button.dart';
import '../../../Constants.dart';

class FloatingButton extends StatelessWidget {

  final VoidCallback onpressed;
  const FloatingButton({required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(left: 30.0 ,right: 0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width, // Adjust the width as needed
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(globalRadius.borderRadius_m), // Adjust the radius as needed
            ),
            elevation: 10,
            color: themeColor.colorBgPrimary,
            child: Container(
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [Material(
                  borderRadius: BorderRadius.circular(200),
                  elevation: 10,
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(

                      shape: BoxShape.circle,
                      color: themeColor.colorBgPrimary,
                    ),
                    child: Icon(
                      Icons.bookmark,
                      color: themeColor.colorAccentPrimary,
                    ),
                  ),
                ),Container(
                    width: 240,
                    child: LargeButton(label: 'Book Now', onPressed: onpressed,))],
              ),
            ),
          ),
        ),
      ),
    );
  }
}