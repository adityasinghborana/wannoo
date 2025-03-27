import 'package:flutter/material.dart';

import '../../../components/large_button.dart';
import '../../../constants.dart';

class FloatingButton extends StatelessWidget {
  final VoidCallback onpressed;
  const FloatingButton({super.key, required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(left: 30.0, right: 0),
        child: SizedBox(
          width:
              MediaQuery.of(context).size.width, // Adjust the width as needed
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  GlobalRadius.borderRadius_m), // Adjust the radius as needed
            ),
            elevation: 10,
            color: ThemeColor.colorBgPrimary,
            child: SizedBox(
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Material(
                    borderRadius: BorderRadius.circular(200),
                    elevation: 10,
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: ThemeColor.colorBgPrimary,
                      ),
                      child: const Icon(
                        Icons.bookmark,
                        color: ThemeColor.colorAccentPrimary,
                      ),
                    ),
                  ),
                  SizedBox(
                      width: 240,
                      child: LargeButton(
                        label: 'Book Now',
                        onPressed: onpressed,
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
