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

Future<void> clearUserUID() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove('userUID');
  if (kDebugMode) {
    print("userid saved");
  }
}
