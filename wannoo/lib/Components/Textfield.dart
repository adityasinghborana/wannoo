import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wannoo/Constants.dart';

class TextFieldCustom extends StatelessWidget {
  final TextEditingController textController;
  final bool hideText;

  final String? hintText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Color? fillColor;

  TextFieldCustom({
    this.hideText = false,
    required this.textController,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.fillColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: themeColor.colorBgSecondory,
      decoration: InputDecoration(
        filled: fillColor != null,
        // Only fill if fillColor is not null
        fillColor: fillColor,
        // Background color of the TextFormField
        enabledBorder: OutlineInputBorder(
          borderRadius:
              BorderRadius.all(Radius.circular(globalRadius.borderRadius_m)),
          borderSide: BorderSide(width: 1, color: themeColor.colorBorder),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius:
              BorderRadius.all(Radius.circular(globalRadius.borderRadius_m)),
          borderSide: BorderSide(width: 1, color: themeColor.colorBgSecondory),
        ),
        hintText: hintText,
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
      ),
      controller: textController,
      obscureText: hideText,
    );
  }
}
