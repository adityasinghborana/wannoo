import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wannoo/Constants.dart';

import '../../../Components/large_button.dart';
import '../../../routes.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Login"),
      ),
      body: Column(
        children: [
          Image.asset(image.logoOrange,height: 300,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: globalPadding.buttonSmallpx),
            child: LargeButton(
              label: 'Login',
              onPressed: () {
                Get.toNamed(AppRoutes.onboarding);
              },
            ),
          ),
        ],
      ),
    );
  }
}
