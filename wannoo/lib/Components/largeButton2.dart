import 'package:flutter/material.dart';
import 'package:wannoo/Constants.dart';

class LargeButton2 extends StatelessWidget {
  final String label;
  final double height;
  final VoidCallback onPressed;

  const LargeButton2({
    Key? key,
    required this.label,
    required this.height,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity, // Full width
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: themeColor.colorBgSecondory, // Background color
          foregroundColor: themeColor.colorWhite, // Text color
          elevation: 5, // Elevation/shadow
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                globalRadius.borderRadius_m), // Border radius
          ),
        ),
        child: Text(label),
      ),
    );
  }
}
