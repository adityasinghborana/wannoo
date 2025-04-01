import 'package:get/get.dart';
import 'package:wannoo/auth_module/login_module/presentation/login_screen.dart';
import 'package:wannoo/auth_module/signup_module/presentation/signup_screen.dart';
import 'package:wannoo/category_places/presentation_layer/category_places_screen.dart';
import 'package:wannoo/bookings/presentation_layer/bookings_screen.dart';
import 'package:wannoo/bookings/presentation_layer/external_site.dart';
import 'package:wannoo/bookings/presentation_layer/payment_failure.dart';
import 'package:wannoo/categories/presentation_layer/category_screen.dart';
import 'package:wannoo/congratulations/presentation_layer/congratulation_screen.dart';
import 'package:wannoo/homepage/presentation_layer/homepage_screen.dart';
import 'package:wannoo/itinarary/presentation_layer/itinarary_screen.dart';
import 'package:wannoo/places_detail/presentation_layer/place_details_screen.dart';
import 'package:wannoo/profile/edit_profile_screen.dart';
import 'package:wannoo/profile/help_screen.dart';
import 'package:wannoo/profile/legal_screen.dart';
import 'package:wannoo/profile/presentationlayer/profile_screen.dart';
import 'package:wannoo/search/presentation_layer/search_result_screen.dart';
import 'package:wannoo/search/presentation_layer/search_screen.dart';
import 'package:wannoo/splash_screen.dart';
import 'onboarding_screen/presentation/onboarding_screen.dart';
import 'bookings/presentation_layer/payment_sucess.dart'; // Splash screen widget

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
