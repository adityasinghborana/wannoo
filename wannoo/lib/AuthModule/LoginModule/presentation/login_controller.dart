import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wannoo/routes.dart';

class LoginController extends GetxController {
  final RxBool obsecureText = true.obs;

  final firebase_auth.FirebaseAuth firebaseAuth =
      firebase_auth.FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> signIn() async {
    try {
      final userCredential = await firebaseAuth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      final uid = userCredential.user?.uid;
      if (uid != null) {
        await saveUserUID(uid).then((value) {
          Get.toNamed(AppRoutes.congratulations); // later change it to home
        });
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }



  Future<void> saveUserUID(String uid) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userUID', uid);
    if (kDebugMode) {
      print("userid saved");
    }
  }

  Future<void> googleSignIn(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      if (googleSignInAccount == null)
        throw 'Google sign-in process canceled by user.';

      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      final UserCredential userCredential =
          await firebaseAuth.signInWithCredential(credential);
      final String uid = userCredential.user!.uid;
      final String name = userCredential.user!.displayName!;
      await saveUserUID(uid);
      Get.toNamed(AppRoutes.congratulations);
    } catch (e) {
      showSnackBar(context, e.toString());
      Get.toNamed(AppRoutes.login);
    }
  }

  Future<void> signOut({required BuildContext context}) async {
    try {
      await firebaseAuth.signOut();
      await _googleSignIn.signOut();
      Get.toNamed(AppRoutes.login);

      showSnackBar(context, 'Sign-out successful.');
    } catch (e) {
      print("Sign-out error: $e");
      showSnackBar(context, e.toString());
    }
  }

  void showSnackBar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }
}
