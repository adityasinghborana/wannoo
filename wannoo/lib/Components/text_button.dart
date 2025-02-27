import 'package:flutter/material.dart';
import 'package:wannoo/Constants.dart';

class CustomTextButton extends StatelessWidget {
  final VoidCallback onpressed;
  final String label;
  const CustomTextButton({
    super.key,
    required this.onpressed,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
          backgroundColor: themeColor.colorBgPrimary,
          foregroundColor: themeColor.colorLink,
          textStyle: const TextStyle(
            decoration: TextDecoration.underline,
          ),
        ),
        onPressed: onpressed,
        child: Text(label));
  }
}
