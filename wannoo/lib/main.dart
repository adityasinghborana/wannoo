import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wannoo/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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

      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splash, // Set splash screen as the initialroute
      getPages: AppRoutes.routes,
    );
  }
}
