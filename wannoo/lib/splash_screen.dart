import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:wannoo/Constants.dart';
import 'Onboardingscreen/presentation/Onboarding_screen.dart';
// Import your constants

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splashIconSize: 300,
      splash: 'asset/images/logo.png',
      nextScreen: OnBoardingScreen(),
      splashTransition: SplashTransition.scaleTransition,
      backgroundColor: themeColor.colorBgSecondory,
    );
  }
}
