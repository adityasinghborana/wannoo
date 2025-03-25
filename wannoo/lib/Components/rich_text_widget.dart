import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Constants.dart';
import '../routes.dart';

class RichTextWidget extends StatelessWidget {
  const RichTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: staticText.signUpToLogin,
        style: const TextStyle(color: ThemeColor.colorTextPrimary),
        children: [
          WidgetSpan(
            child: InkWell(
              onTap: () {
                Get.toNamed(AppRoutes.signup);
              },
              child: const Text(
                staticText.signUpLinkText,
                style: TextStyle(
                  color: ThemeColor.colorLink, // Change color if needed
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
