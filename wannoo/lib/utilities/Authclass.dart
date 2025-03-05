import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveUserUID(String uid) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('userUID', uid);
  if (kDebugMode) {
    print("userid saved");
  }
}

Future<String?> getUserUID() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? savedUid = await prefs.getString('userUID');
  return savedUid;
}

Future<String?> getUserID() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? getId = await prefs.getString('userID');
  return getId;
}

Future<String?> saveUserID(String id) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  await prefs.setString('userID', id);
  if (kDebugMode) {
    print("useridno saved");
  }
}

Future<void> clearUserUID() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove('userUID');
  if (kDebugMode) {
    print("userid saved");
  }
}
