import 'package:flutter/material.dart';
import 'package:wannoo/Constants.dart';

class LargeButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const LargeButton({
    Key? key,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
     height: Height.heightButtonLarge,
      width: double.infinity, // Full width
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: themeColor.colorBgSecondory, // Background color
          foregroundColor: themeColor.colorWhite, // Text color
          elevation: 5, // Elevation/shadow
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(globalRadius.borderRadius_m), // Border radius
          ),
        ),
        child: Text(label),
      ),
    );
  }
}
