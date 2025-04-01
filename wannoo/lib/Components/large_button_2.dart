import 'package:flutter/material.dart';
import 'package:wannoo/constants.dart';

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
          backgroundColor: ThemeColor.colorBgSecondory, // Background color
          foregroundColor: ThemeColor.colorWhite, // Text color
          elevation: 5, // Elevation/shadow
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                GlobalRadius.borderRadiusMedium), // Border radius
          ),
        ),
        child: Text(label),
      ),
    );
  }
}
