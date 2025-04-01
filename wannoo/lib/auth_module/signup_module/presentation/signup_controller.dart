import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:wannoo/auth_module/signup_module/users_data_layer/model/request/create_user_request.dart';
import 'package:wannoo/auth_module/signup_module/users_data_layer/repository/user_repository.dart';
import 'package:wannoo/auth_module/signup_module/users_data_layer/usecase/create_user_usecase.dart';

import '../../../routes.dart';
import '../../../utilities/auth_class.dart';
import '../users_data_layer/service/create_user_remote.dart';

class SignUpController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final RxBool obscureText = true.obs;
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  final CreateUserUseCase createUserUseCase =
      CreateUserUseCase(UserRepositoryImpl(CreateUserRemoteService(Dio())));

  void signUp() async {
    try {
      final authResult = await firebase_auth.FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      final user = authResult.user;
      if (user != null) {
        final uid = user.uid;
        await createUserUseCase
            .execute(UserModel(uid: uid, email: user.email ?? ""));
        await saveUserUID(uid);
        Get.toNamed(AppRoutes.congratulations);
      }
    } catch (e) {
      final errorMessage = e.toString().replaceFirst('firebase_auth/', '');
      Get.snackbar("Error", errorMessage);
    }
  }

  Future<void> saveUser(String uid, String email) async {
    try {
      await createUserUseCase.execute(UserModel(uid: uid, email: email));
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  // void createCart(String uid) async {
  //   try {
  //     final request = CreateCartRequest(userId: uid);
  //     await createCartUseCase.execute(request);
  //   } catch (e) {
  //     if (kDebugMode) {
  //       print(e);
  //     }
  //   }
  // }

  Future<void> googleSignUp(BuildContext context) async {
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

      final UserCredential userCredential = await firebase_auth
          .FirebaseAuth.instance
          .signInWithCredential(credential);
      final user = userCredential.user;
      if (user != null) {
        final uid = user.uid;
        await saveUserUID(uid);
        await saveUser(user.uid, user.email!);
        Get.toNamed(AppRoutes.congratulations);
      }
    } catch (e) {
      debugPrint("Google sign-up error: $e");
      if (!context.mounted) return;
      showSnackBar(context, e.toString());
      Get.toNamed(AppRoutes.signup);
    }
  }

  void showSnackBar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }
}
