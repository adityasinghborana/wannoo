import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wannoo/Constants.dart';
import 'package:wannoo/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey =
      "pk_test_51QNjaH054MnBKf9Q79c0lH67iegsSGH7iZqFJeeyfdkhrFA9IPWXsLO04dYVErBrVaE0A0kYc6P9s3dQZmGUO7JX00tBLep6oV";
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyAjG_ULtXk-_9JVgqRgyuuIKnS46Lptp7E",
      projectId: "wannaoo",
      storageBucket: "wannaoo.appspot.com",
      messagingSenderId: "623201882335",
      appId: "1:623201882335:android:064718276631d077e8996a",
    ),
  );
  SharedPreferences prefs = await SharedPreferences.getInstance();
  Get.put(prefs);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        fontFamily: GoogleFonts.inter().fontFamily,
        // Sets Inter as the default font family
        scaffoldBackgroundColor: themeColor.colorscafold,
        appBarTheme: AppBarTheme(
          color: themeColor.colorBgPrimary,
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.home, // Set splash screen as the initialroute
      getPages: AppRoutes.routes,
    );
  }
}
