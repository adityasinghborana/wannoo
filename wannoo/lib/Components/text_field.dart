import 'package:flutter/material.dart';
import 'package:wannoo/constants.dart';

class TextFieldCustom extends StatelessWidget {
  final TextEditingController textController;
  final bool hideText;

  final String? hintText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Color? fillColor;

  const TextFieldCustom({
    super.key,
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
      cursorColor: ThemeColor.colorBgSecondory,
      decoration: InputDecoration(
        filled: fillColor != null,
        // Only fill if fillColor is not null
        fillColor: fillColor,
        // Background color of the TextFormField
        enabledBorder: const OutlineInputBorder(
          borderRadius:
              BorderRadius.all(Radius.circular(GlobalRadius.borderRadius_m)),
          borderSide: BorderSide(width: 1, color: ThemeColor.colorBorder),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius:
              BorderRadius.all(Radius.circular(GlobalRadius.borderRadius_m)),
          borderSide: BorderSide(width: 1, color: ThemeColor.colorBgSecondory),
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
