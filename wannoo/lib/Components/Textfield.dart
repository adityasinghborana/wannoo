import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wannoo/Constants.dart';

class TextFieldCustom extends StatelessWidget {
  final TextEditingController textController;
  final bool hideText;

  TextFieldCustom({this.hideText = false, required this.textController});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: themeColor.colorBgSecondory,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(globalRadius.borderRadius_m)),
          borderSide: BorderSide(width: 2, color: themeColor.colorBorder),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(globalRadius.borderRadius_m)),
          borderSide: BorderSide(width: 2, color: themeColor.colorBgSecondory), // You can customize the color here
        ),
      ),
      controller: textController,
      obscureText: hideText,
    );
  }
}
