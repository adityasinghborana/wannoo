import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wannoo/auth_module/signup_module/presentation/signup_controller.dart';
import 'package:wannoo/components/text_field.dart';
import 'package:wannoo/constants.dart';
import '../../../components/large_button.dart';
import '../../../components/sociallogin_buttons.dart';
import '../../../components/text_button.dart';
import '../../../routes.dart';

class SignUpPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final SignUpController signupController = Get.put(SignUpController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("SignUp"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              width: 250,
              height: 200,
              StaticImage.logoOrange,
            ),
            const Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: GlobalPadding.buttonSmallpx),
              child: Row(
                children: [Text(StaticText.loginEmail)],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: GlobalPadding.buttonSmallpx,
                  vertical: GlobalPadding.buttonSmallpy),
              child: TextFieldCustom(
                textController: signupController.emailController,
                hintText: StaticText.loginEmail,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: GlobalPadding.buttonSmallpx,
                  vertical: GlobalPadding.buttonSmallpy),
              child: Row(
                children: [Text(StaticText.loginPassword)],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: GlobalPadding.buttonSmallpx,
                  vertical: GlobalPadding.buttonSmallpy),
              child: TextFieldCustom(
                textController: signupController.passwordController,
                hideText: true,
                hintText: StaticText.loginPassword,
              ),
            ),
            const SizedBox(
              height: Height.heightl,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: GlobalPadding.buttonSmallpx),
              child: LargeButton(
                label: 'Sign Up',
                onPressed: () {
                  signupController.signUp();
                },
              ),
            ),
            const SizedBox(
              height: Height.heightl,
            ),
            RichText(
              text: TextSpan(
                text: StaticText.loginToSignup,
                style: const TextStyle(color: ThemeColor.colorTextPrimary),
                children: [
                  WidgetSpan(
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(AppRoutes.login);
                      },
                      child: const Text(
                        StaticText.signInLinkText,
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
                signupController.googleSignUp(context);
              },
              imagepath: StaticImage.googleIcon,
              label: StaticText.signupGoogle,
            ),
            const SizedBox(
              height: Height.heightl,
            ),
            // SocialLoginButton(onpressed: (){null;},imagepath: ImagefacebookIcon,label: StaticText.signupFacebook,),
            // SizedBox(height: Height.heightl,),
            //Text("or"),
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
