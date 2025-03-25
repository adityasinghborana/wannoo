import 'package:flutter/material.dart';

openIconSnackBar(
  context,
  String text,
  Widget icon,
) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: Colors.green,
    content: Container(
      child: Row(
        children: [
          icon,
          SizedBox(
            width: 5,
          ),
          Text(text)
        ],
      ),
    ),
    duration: const Duration(milliseconds: 2500),
  ));
}
