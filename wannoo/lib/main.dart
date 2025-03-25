import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wannoo/Constants.dart';
import 'package:wannoo/routes.dart';
import 'package:wannoo/utilities/auth_class.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey =
      "pk_test_51QK1Y1FTDzopbL39kPQLJL9JlslFkn3wQmBx66ggx6QrqK2VEvEkO6LMnUx03lzPeJ6MOyWPCK3DTsvHSlsn3Elj00zILvsJ2S";
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
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<String?>? savedUserFuture;

  @override
  void initState() {
    super.initState();
    savedUserFuture = getUserUID();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: savedUserFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Show loading screen while fetching user data
          return const MaterialApp(
            home: Scaffold(
              body: Center(child: CircularProgressIndicator()),
            ),
          );
        }

        String? savedUser = snapshot.data;
        debugPrint("Hello, saved UID: ${savedUser ?? 'No UID found'}");

        return GetMaterialApp(
          theme: ThemeData(
            fontFamily: GoogleFonts.inter().fontFamily,
            scaffoldBackgroundColor: ThemeColor.colorscafold,
            appBarTheme: const AppBarTheme(
              color: ThemeColor.colorBgPrimary,
            ),
          ),
          debugShowCheckedModeBanner: false,
          initialRoute: savedUser != null ? AppRoutes.home : AppRoutes.splash,
          getPages: AppRoutes.routes,
        );
      },
    );
  }
}
