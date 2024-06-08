import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wannoo/Components/Textfield.dart';
import 'package:wannoo/Constants.dart';

import '../../../Components/large_button.dart';
import '../../../routes.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
   LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Login"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image.logoOrange,),
          Padding(
      padding: const EdgeInsets.symmetric(horizontal: globalPadding.buttonSmallpx),
            child: TextFieldCustom(textController: emailController),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: globalPadding.buttonSmallpx ,vertical: globalPadding.buttonSmallpy),
            child: TextFieldCustom(textController: passwordController,hideText: true,),
          ),
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
