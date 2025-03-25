import 'package:get/get.dart';
import 'package:wannoo/AuthModule/LoginModule/presentation/login_screen.dart';
import 'package:wannoo/AuthModule/signup_module/presentation/signup_screen.dart';
import 'package:wannoo/Categoryplaces/presentationlayer/categoryplacesscreen.dart';
import 'package:wannoo/bookings/presentationlayer/bookingsscreen.dart';
import 'package:wannoo/bookings/presentationlayer/external_site.dart';
import 'package:wannoo/bookings/presentationlayer/paymentfailure.dart';
import 'package:wannoo/categories/presentationlayer/categoryscreen.dart';
import 'package:wannoo/congratulations/presentationlayer/congratulation_screen.dart';
import 'package:wannoo/homepage/presentationlayer/homepage_screen.dart';
import 'package:wannoo/itinarary/presentationlayer/Itinarary_screen.dart';
import 'package:wannoo/places_detail/presentationlayer/placedetails_screen.dart';
import 'package:wannoo/profile/edit_profile_screen.dart';
import 'package:wannoo/profile/help_screen.dart';
import 'package:wannoo/profile/legal_screen.dart';
import 'package:wannoo/profile/presentationlayer/profilescreen.dart';
import 'package:wannoo/search/presentationlayer/searchresultscreen.dart';
import 'package:wannoo/search/presentationlayer/searchscreen.dart';
import 'package:wannoo/splash_screen.dart';
import 'Onboardingscreen/presentation/onboarding_screen.dart';
import 'bookings/presentationlayer/paymentsucess.dart'; // Splash screen widget

class AppRoutes {
  static const splash = '/';
  static const onboarding = '/onboarding';
  static const login = '/login';
  static const signup = '/signup';
  static const home = '/home';
  static const congratulations = '/congratulations';
  static const placedetails = '/placedetails';
  static const allcategories = '/allcategories';
  static const search = '/search';
  static const searchresult = '/searchresult';
  static const categoryplaces = '/categoryplaces';
  static const profile = '/profile';
  static const booking = '/booking';
  static const externalSite = '/externalsite';
  static const paymentSuccess = '/paymentsucess';
  static const paymentFailure = '/paymentfailure';
  static const savedList = '/savedlist';
  static const legalScreen = '/legal';
  static const helpScreen = '/help';
  static const editProfile = '/editprofile';

  static List<GetPage> routes = [
    GetPage(
      name: splash,
      page: () => const SplashScreen(), // Reference to your SplashScreen widget
    ),
    GetPage(
      name: onboarding,
      page: () => const OnBoardingScreen(),
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
      page: () => const CongratultionsPage(),
    ),
    GetPage(
      name: home,
      page: () => const HomepageScreen(),
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
      page: () => const SearchScreen(),
    ),
    GetPage(
      name: searchresult,
      page: () => const SearchResultScreen(),
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
      name: externalSite,
      page: () => ExternalWebsite(),
    ),
    GetPage(
      name: paymentSuccess,
      page: () => const PaymentSuccess(),
    ),
    GetPage(
      name: paymentFailure,
      page: () => const PaymentFailure(),
    ),
    GetPage(
      name: savedList,
      page: () => ItinararyScreen(),
    ),
    GetPage(
      name: legalScreen,
      page: () => const LegalScreen(),
    ),
    GetPage(
      name: helpScreen,
      page: () => const HelpScreen(),
    ),
    GetPage(
      name: editProfile,
      page: () => const EditProfile(),
    ),
  ];
}
