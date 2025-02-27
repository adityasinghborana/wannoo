import 'package:get/get.dart';
import 'package:wannoo/AuthModule/LoginModule/presentation/login_screen.dart';
import 'package:wannoo/AuthModule/SignupModule/presentation/signup_screen.dart';
import 'package:wannoo/Categoryplaces/presentationlayer/categoryplacesscreen.dart';
import 'package:wannoo/bookings/presentationlayer/bookingsscreen.dart';
import 'package:wannoo/bookings/presentationlayer/externalSite.dart';
import 'package:wannoo/bookings/presentationlayer/paymentfailure.dart';
import 'package:wannoo/categories/presentationlayer/categoryscreen.dart';
import 'package:wannoo/congratulations/presentationlayer/congratulation_Screen.dart';
import 'package:wannoo/homepage/presentationlayer/homepage_screen.dart';
import 'package:wannoo/itinarary/presentationlayer/ItinararyScreen.dart';
import 'package:wannoo/places_detail/presentationlayer/placedetails_screen.dart';
import 'package:wannoo/profile/editprofilescreen.dart';
import 'package:wannoo/profile/helpscreen.dart';
import 'package:wannoo/profile/legalscreen.dart';
import 'package:wannoo/profile/presentationlayer/profilescreen.dart';
import 'package:wannoo/search/presentationlayer/searchresultscreen.dart';
import 'package:wannoo/search/presentationlayer/searchscreen.dart';
import 'package:wannoo/splash_screen.dart';
import 'Onboardingscreen/presentation/Onboarding_screen.dart';
import 'bookings/presentationlayer/paymentsucess.dart'; // Splash screen widget

class AppRoutes {
  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String home = '/home';
  static const String congratulations = '/congratulations';
  static const String placedetails = '/placedetails';
  static const String allcategories = '/allcategories';
  static const String search = '/search';
  static const String searchresult = '/searchresult';
  static const String categoryplaces = '/categoryplaces';
  static const String profile = '/profile';
  static const String booking = '/booking';
  static const String ExternalSite = '/externalsite';
  static const String paymentSuccess = '/paymentsucess';
  static const String paymentFailure = '/paymentfailure';
  static const String savedList = '/savedlist';
  static const String legalScreen = '/legal';
  static const String helpScreen = '/help';
  static const String editProfile = '/editprofile';

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
    GetPage(
      name: placedetails,
      page: () => PlaceDetailsScreen(),
    ),
    GetPage(
      name: allcategories,
      page: () => AllCategoryScreen(),
    ),
    GetPage(
      name: search,
      page: () => SearchScreen(),
    ),
    GetPage(
      name: searchresult,
      page: () => SearchResultScreen(),
    ),
    GetPage(
      name: categoryplaces,
      page: () => CategoryPlacesScreen(),
    ),
    GetPage(
      name: profile,
      page: () => ProfileScreen(),
    ),
    GetPage(
      name: booking,
      page: () => BookingsScreen(),
    ),
    GetPage(
      name: ExternalSite,
      page: () => ExternalWebsite(),
    ),
    GetPage(
      name: paymentSuccess,
      page: () => PaymentSuccess(),
    ),
    GetPage(
      name: paymentFailure,
      page: () => PaymentFailure(),
    ),
    GetPage(
      name: savedList,
      page: () => ItinararyScreen(),
    ),
    GetPage(
      name: legalScreen,
      page: () => LegalScreen(),
    ),
    GetPage(
      name: helpScreen,
      page: () => HelpScreen(),
    ),
    GetPage(
      name: editProfile,
      page: () => EditProfile(),
    ),
  ];
}
