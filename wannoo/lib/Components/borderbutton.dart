import 'package:flutter/material.dart';
import 'package:wannoo/constants.dart';

class InvertedButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  const InvertedButton(
      {super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ButtonStyle(
          minimumSize: WidgetStateProperty.all(const Size(double.infinity, 50)),
          elevation: WidgetStateProperty.all(0),
          alignment: Alignment.center,
          side: WidgetStateProperty.all(
              const BorderSide(width: 1, color: ThemeColor.colorBgSecondory)),
          backgroundColor: WidgetStateProperty.all(Colors.transparent),
          shape: WidgetStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0)))),
      onPressed: onPressed,
      child: Text(
        text,
        style:
            const TextStyle(color: ThemeColor.colorBgSecondory, fontSize: 16),
      ),
    );
  }
}
