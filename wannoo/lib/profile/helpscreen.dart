import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:wannoo/Components/large_button.dart';
import 'package:wannoo/Constants.dart';

import '../Components/Textfield.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Help And Support"),
          centerTitle: true,
        ),
        body: InfoCard());
  }
}

class InfoCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.0),
      child: Column(
        children: [
          Container(
              height: 400,
              padding: EdgeInsets.all(20.0),
              width: Get.width,
              decoration: BoxDecoration(
                color: themeColor.colorBgPrimary,
                borderRadius: BorderRadius.circular(25.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.05),
                    offset: Offset(0, 10),
                    blurRadius: 0,
                    spreadRadius: 0,
                  )
                ],
              ),
              child: _buildReplySection()),
          ContactInfo()
        ],
      ),
    );
  }
}

Widget _buildReplySection() {
  final TextEditingController name = TextEditingController();
  // final ContactUsController controller = Get.put(
  //   ContactUsController(
  //     getContactUsDataUseCase: GetContactUsDataUseCase(
  //       ContactUsRepositoryImpl(
  //         ContactusRemote(Dio()),
  //       ),
  //     ),
  //     postFormUsecase: PostFormUseCase(
  //       ContactUsRepositoryImpl(
  //         ContactusRemote(Dio()),
  //       ),
  //     ),
  //   ),
  // );
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      const SizedBox(height: 10),
      TextFieldCustom(
          textController: name, hideText: false, hintText: "Enter Your Name"),
      SizedBox(
        height: 30,
      ),
      TextFieldCustom(textController: name, hideText: false, hintText: "Email"),
      SizedBox(
        height: 30,
      ),
      TextFieldCustom(
          textController: name, hideText: false, hintText: "Message"),
      Expanded(child: Container()),
      SizedBox(
          width: 400, child: LargeButton(label: "Submit", onPressed: () => {}))
    ],
  );
}

Widget ContactInfo() {
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
              subtitle: 'Contact@wanno.com',
            ),
            Gap(20),
            CardFb1(
              text: 'Call Us',
              icon: Icons.phone,
              subtitle: '+91999999999',
            ),
          ],
        ),
        Gap(20),
        CardFb1(
          text: 'Reach Us',
          icon: Icons.pin_drop,
          subtitle: '23 street block 2 Nottingham South Hempstead',
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
