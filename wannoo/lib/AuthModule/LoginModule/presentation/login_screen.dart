import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wannoo/Components/Textfield.dart';
import 'package:wannoo/Components/sociallogin_buttons.dart';
import 'package:wannoo/Components/text_button.dart';
import 'package:wannoo/Constants.dart';
import '../../../Components/large_button.dart';
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
            Image.asset(
              image.logoOrange,
            ),
            const Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: globalPadding.px_l),
              child: Row(
                children: [Text(staticText.loginEmail)],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: globalPadding.px_l,
                  vertical: globalPadding.buttonSmallpy),
              child: TextFieldCustom(
                  textController: loginController.emailController,hintText:staticText.loginEmail),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: globalPadding.px_l,
                  vertical: globalPadding.buttonSmallpy),
              child: Row(
                children: [Text(staticText.loginPassword)],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: globalPadding.px_l,
                  vertical: globalPadding.buttonSmallpy),
              child: TextFieldCustom(
                textController: loginController.passwordController,
                hideText: true,hintText:staticText.loginPassword
              ),
            ),
            SizedBox(height: Height.heightl,),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: globalPadding.px_l),
              child: LargeButton(
                label: 'Login',
                onPressed: () {
                  loginController.signIn();
                },
              ),
            ),
            SizedBox(height: Height.heightl,),
            RichText(
              text: TextSpan(
                text: staticText.signUpToLogin,
                style: TextStyle(color: themeColor.colorTextPrimary),
                children: [
                  WidgetSpan(
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(AppRoutes.signup);
                      },
                      child: Text(
                        staticText.signUpLinkText,
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
            SizedBox(height: Height.heightl,),
            Text("or"),
            SizedBox(height: Height.heightl,),
            SocialLoginButton(onpressed: (){null;},imagepath: image.googleIcon,label: staticText.loginGoogle,),
            SizedBox(height: Height.heightl,),
            SocialLoginButton(onpressed: (){null;},imagepath: image.facebookIcon,label: staticText.loginFacebook,),
            Text("or"),
            SizedBox(height: Height.heightl,),
            CustomTextButton(onpressed: (){}, label: 'forgot password')
        
          ],
        ),
      ),
    );
  }
}
