import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wannoo/components/text_field.dart';
import 'package:wannoo/components/sociallogin_buttons.dart';
import 'package:wannoo/components/text_button.dart';
import 'package:wannoo/constants.dart';
import '../../../components/large_button.dart';
import '../../../routes.dart';
import 'login_controller.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.put(LoginController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Login"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 200,
              width: 250,
              child: Image.asset(
                width: 250,
                height: 250,
                image.logoOrange,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: GlobalPadding.px_l),
              child: Row(
                children: [Text(staticText.loginEmail)],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: GlobalPadding.px_l,
                  vertical: GlobalPadding.buttonSmallpy),
              child: TextFieldCustom(
                  textController: loginController.emailController,
                  hintText: staticText.loginEmail),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: GlobalPadding.px_l,
                  vertical: GlobalPadding.buttonSmallpy),
              child: Row(
                children: [Text(staticText.loginPassword)],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: GlobalPadding.px_l,
                  vertical: GlobalPadding.buttonSmallpy),
              child: TextFieldCustom(
                  textController: loginController.passwordController,
                  hideText: true,
                  hintText: staticText.loginPassword),
            ),
            const SizedBox(
              height: Height.heightl,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: GlobalPadding.px_l),
              child: LargeButton(
                label: 'Login',
                onPressed: () {
                  loginController.signIn();
                },
              ),
            ),
            const SizedBox(
              height: Height.heightl,
            ),
            RichText(
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
            ),
            const SizedBox(
              height: Height.heightl,
            ),
            const Text("or"),
            const SizedBox(
              height: Height.heightl,
            ),
            SocialLoginButton(
              onpressed: () {
                loginController.googleSignIn(context);
              },
              imagepath: image.googleIcon,
              label: staticText.loginGoogle,
            ),
            // SizedBox(
            //   height: Height.heightl,
            // ),
            // SocialLoginButton(
            //   onpressed: () {
            //     null;
            //   },
            //   imagepath: image.facebookIcon,
            //   label: staticText.loginFacebook,
            // ),
            // Text("or"),
            const SizedBox(
              height: Height.heightl,
            ),
            CustomTextButton(onpressed: () {}, label: 'forgot password')
          ],
        ),
      ),
    );
  }
}
