import 'package:get/get.dart';
import 'package:wannoo/AuthModule/LoginModule/presentation/login_screen.dart';
import 'package:wannoo/AuthModule/SignupModule/presentation/signup_screen.dart';
import 'package:wannoo/congratulations/presentationlayer/congratulation_Screen.dart';
import 'package:wannoo/homepage/presentationlayer/homepage_screen.dart';
import 'package:wannoo/splash_screen.dart';
import 'Onboardingscreen/presentation/Onboarding_screen.dart'; // Splash screen widget

class AppRoutes {
  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String home = '/home';
  static const String congratulations = '/congratulations';

  static List<GetPage> routes = [
    GetPage(
      name: splash,
      page: () => SplashScreen(), // Reference to your SplashScreen widget
    ),
    GetPage(
      name: onboarding,
      page: () => OnBoardingScreen(),
    ),
    GetPage(
      name: login,
      page: () => LoginPage(),
    ),
    GetPage(
      name: signup,
      page: () => SignUpPage(),
    ),
    GetPage(
      name: congratulations,
      page: () => CongratultionsPage(),
    ),
    GetPage(
      name: home,
      page: () => HomepageScreen(),
    ),

  ];
}
