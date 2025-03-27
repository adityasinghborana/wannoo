import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:wannoo/components/large_button.dart';
import 'package:wannoo/constants.dart';
import 'package:wannoo/profile/presentationlayer/help_screen_controller.dart';

import '../components/text_field.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HelpScreenController helpScreenController =
        Get.put(HelpScreenController());
    return Scaffold(
        appBar: AppBar(
          title: const Text("Help And Support"),
          centerTitle: true,
        ),
        body: Obx(
          () => InfoCard(
            helpScreenController.email.value,
            helpScreenController.mobile.value,
            helpScreenController.address.value,
            name: helpScreenController.name,
            emailController: helpScreenController.emailController,
            message: helpScreenController.message,
            onPressed: helpScreenController.sendData,
          ),
        ));
  }
}

class InfoCard extends StatelessWidget {
  final TextEditingController name;
  final TextEditingController emailController;
  final TextEditingController message;
  final String email;
  final String mobile;
  final String address;
  final VoidCallback onPressed;
  const InfoCard(
    this.email,
    this.mobile,
    this.address, {
    super.key,
    required this.name,
    required this.emailController,
    required this.message,
    required this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Container(
              height: 400,
              padding: const EdgeInsets.all(20.0),
              width: Get.width,
              decoration: BoxDecoration(
                color: ThemeColor.colorBgPrimary,
                borderRadius: BorderRadius.circular(25.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.05),
                    offset: const Offset(0, 10),
                    blurRadius: 0,
                    spreadRadius: 0,
                  )
                ],
              ),
              child: _buildReplySection(
                  name: name,
                  email: emailController,
                  message: message,
                  onPressed: onPressed)),
          ContactInfo(email, mobile, address)
        ],
      ),
    );
  }
}

Widget _buildReplySection(
    {required TextEditingController name,
    required TextEditingController email,
    required TextEditingController message,
    required VoidCallback onPressed}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      const SizedBox(height: 10),
      TextFieldCustom(
          textController: name, hideText: false, hintText: "Enter Your Name"),
      const SizedBox(
        height: 30,
      ),
      TextFieldCustom(
          textController: email, hideText: false, hintText: "Email"),
      const SizedBox(
        height: 30,
      ),
      TextFieldCustom(
          textController: message, hideText: false, hintText: "Message"),
      Expanded(child: Container()),
      SizedBox(
          width: 400, child: LargeButton(label: "Submit", onPressed: onPressed))
    ],
  );
}

Widget ContactInfo(email, mobilenumber, address) {
  return Expanded(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CardFb1(
              text: 'Email Us',
              icon: Icons.mail,
              subtitle: email,
            ),
            const Gap(20),
            CardFb1(
              text: 'Call Us',
              icon: Icons.phone,
              subtitle: mobilenumber,
            ),
          ],
        ),
        const Gap(20),
        CardFb1(
          text: 'Reach Us',
          icon: Icons.pin_drop,
          subtitle: address,
        ),
      ],
    ),
  );
}

class CardFb1 extends StatelessWidget {
  final String text;
  final IconData icon;
  final String subtitle;

  const CardFb1(
      {required this.text,
      required this.icon,
      required this.subtitle,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.5),
        boxShadow: [
          BoxShadow(
              offset: const Offset(10, 20),
              blurRadius: 10,
              spreadRadius: 0,
              color: Colors.grey.withOpacity(.05)),
        ],
      ),
      child: Column(
        children: [
          Icon(icon),
          const Spacer(),
          Text(text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              )),
          const SizedBox(
            height: 5,
          ),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.normal,
                fontSize: 12),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
