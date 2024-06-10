import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wannoo/AuthModule/SignupModule/presentation/Signup_controller.dart';
import 'package:wannoo/Components/Textfield.dart';
import 'package:wannoo/Constants.dart';
import '../../../Components/large_button.dart';
import '../../../Components/sociallogin_buttons.dart';
import '../../../routes.dart';


class SignUpPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    final SignUpController  signupController = Get.put(SignUpController ());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("SignUp"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image.logoOrange,
          ),
          const Padding(
            padding:
            EdgeInsets.symmetric(horizontal: globalPadding.buttonSmallpx),
            child: Row(
              children: [Text(staticText.loginEmail)],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: globalPadding.buttonSmallpx,vertical: globalPadding.buttonSmallpy
            ),
            child: TextFieldCustom(textController: signupController.emailController,hintText:staticText.loginEmail ,),
          ),
          const Padding(
            padding:
            EdgeInsets.symmetric(horizontal: globalPadding.buttonSmallpx,vertical: globalPadding.buttonSmallpy),
            child: Row(
              children: [Text(staticText.loginPassword)],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: globalPadding.buttonSmallpx,
                vertical: globalPadding.buttonSmallpy),
            child: TextFieldCustom(
              textController: signupController.passwordController,
              hideText: true, hintText: staticText.loginPassword,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: globalPadding.buttonSmallpx),
            child: LargeButton(
              label: 'Sign Up',
              onPressed: () {
             signupController.signUp();


              },
            ),
          ),
          RichText(
            text: TextSpan(
              text: staticText.loginToSignup,
              style: TextStyle(color: themeColor.colorTextPrimary),
              children: [
                WidgetSpan(
                  child: InkWell(
                    onTap: () {
                      Get.toNamed(AppRoutes.login);
                    },
                    child: Text(
                      staticText.signInLinkText,
                      style: TextStyle(
                        color: themeColor.colorLink, // Change color if needed
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SocialLoginButton(onpressed: (){null;},imagepath: image.googleIcon,label: staticText.signupGoogle,),
          SocialLoginButton(onpressed: (){null;},imagepath: image.facebookIcon,label: staticText.signupFacebook,),
        ],
      ),
    );
  }
}
