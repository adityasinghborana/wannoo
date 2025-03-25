import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:wannoo/profile/legal_screen_controller.dart';

import '../Constants.dart';

class LegalScreen extends StatelessWidget {
  const LegalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LegalScreenController legalScreenController =
        Get.put(LegalScreenController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Policies & Legal"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Obx(
              () => HtmlWidget(
                onTapUrl: (url) async {
                  print("Clicked URL: $url");
                  if (await canLaunchUrl(Uri.parse(url))) {
                    await launchUrl(Uri.parse(url),
                        mode: LaunchMode.externalApplication);
                  } else {
                    print("Could not launch $url");
                  }
                  return true;
                },
                legalScreenController.content.value,
                textStyle: CustomTextStyles.fontL1Medium,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
