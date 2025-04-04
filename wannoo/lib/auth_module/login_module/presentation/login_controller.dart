import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:wannoo/auth_module/datalayer/model/request/delete_user_request.dart';
import 'package:wannoo/auth_module/datalayer/repo/repo.dart';
import 'package:wannoo/auth_module/datalayer/usecase/deleteuserusecase.dart';
import 'package:wannoo/routes.dart';

import '../../../utilities/auth_class.dart';
import '../../../utilities/dialog.dart';
import '../../datalayer/services/remote.dart';

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
          Get.toNamed(AppRoutes.home); // later change it to home
        });
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  Future<void> googleSignIn(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      if (googleSignInAccount == null) {
        throw 'Google sign-in process canceled by user.';
      }

      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      final UserCredential userCredential =
          await firebaseAuth.signInWithCredential(credential);
      final String uid = userCredential.user!.uid;
      await saveUserUID(uid);
      Get.toNamed(AppRoutes.home);
    } catch (e) {
      if (!context.mounted) return;
      showSnackBar(context, e.toString(), state: StateType.error);
      Get.toNamed(AppRoutes.login);
    }
  }

  Future<void> signOut({required BuildContext context}) async {
    try {
      await firebaseAuth.signOut();
      await _googleSignIn.signOut();
      await clearUserUID();

      Get.offAllNamed(AppRoutes.login);
      if (!context.mounted) return;
      showSnackBar(context, 'Sign-out successful.', state: StateType.error);
    } catch (e) {
      debugPrint("Sign-out error: $e");
      showSnackBar(context, e.toString(), state: StateType.error);
    }
  }

  void deleteUser(BuildContext context) async {
    final DeleteUserUseCase deleteUserUseCase =
        DeleteUserUseCase(DeleteUserRepoImpl(DeleteUser(Dio())));
    try {
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        try {
          debugPrint("hello Delete Uid ${user.uid}");
          await deleteUserUseCase
              .execute(DeleteUserRequest(uid: user.uid.toString()));
        } catch (e) {
          debugPrint(e.toString());
        }
        await user.delete(); // Deletes the user from Firebase Authentication
        // Sign out from Firebase and Google (if logged in via Google)
        await firebaseAuth.signOut();
        await _googleSignIn.signOut();

        // Clear locally stored user UID or data
        await clearUserUID();
        // Show success message
        Get.snackbar("Success", "Account deleted successfully",
            snackPosition: SnackPosition.BOTTOM);

        // Navigate to the login or onboarding screen after deletion
        Get.offAllNamed('/login'); // Change to your login screen route
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'requires-recent-login') {
        // If user needs to re-authenticate
        Get.snackbar("Error", "Please re-authenticate before deleting account.",
            snackPosition: SnackPosition.BOTTOM);
      } else {
        Get.snackbar("Error", e.message ?? "Something went wrong",
            snackPosition: SnackPosition.BOTTOM);
      }
    }
  }
}
