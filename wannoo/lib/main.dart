import 'package:flutter/material.dart';

import 'Onboardingscreen/presetation/Onboarding_screen.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home:OnBoardingScreen());
  }
}
