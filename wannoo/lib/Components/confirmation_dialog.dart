import 'package:flutter/material.dart';
import 'package:wannoo/constants.dart';

class CustomAlertDialog extends StatelessWidget {
  final String title;
  final String description;

  final List<TextButton> actions;

  const CustomAlertDialog(
      {required this.title,
      required this.description,
      required this.actions,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: ThemeColor.colorBgPrimary,
      title: Text(title),
      content: Text(description),
      actions: actions,
    );
  }
}
