import 'package:flutter/material.dart';
import 'package:wannoo/constants.dart';

class SocialLoginButton extends StatelessWidget {
  final VoidCallback onpressed;
  final String imagepath;
  final String label;
  const SocialLoginButton(
      {super.key,
      required this.onpressed,
      required this.imagepath,
      required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: GlobalPadding.px_l),
      child: InkWell(
          onTap: onpressed,
          child: Container(
            height: Height.heightButtonLarge,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(GlobalRadius.borderRadius_s),
                border: Border.all(color: ThemeColor.colorBorder, width: 1)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(imagepath),
                Text(label),
              ],
            ),
          )),
    );
  }
}
