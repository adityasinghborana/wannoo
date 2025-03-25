import 'package:flutter/foundation.dart';

import '../model/request/create_user_request.dart';
import '../model/response/create_user_response.dart';
import '../model/response/user_detail_response.dart';
import '../service/create_user_remote.dart';

abstract class UserRepository {
  Future<UserModelResponse> createusers(UserModel requestBody);
  Future<List<UserDetail>> getUserDetail(String uid);
}

class UserRepositoryImpl implements UserRepository {
  final CreateUserRemoteService remoteService;

  UserRepositoryImpl(this.remoteService);

  @override
  Future<UserModelResponse> createusers(UserModel requestBody) async {
    try {
      UserModelResponse response = await remoteService.createuser(requestBody);
      return response;
    } catch (error) {
      // Handle any errors that might occur during the process
      debugPrint("Error creating user: $error");
      rethrow; // Rethrow the error to let the caller handle it
    }
  }

  @override
  Future<List<UserDetail>> getUserDetail(String uid) async {
    try {
      List<UserDetail> response = await remoteService.getUserDetail(uid);
      return response;
    } catch (error) {
      // Handle any errors that might occur during the process
      debugPrint("Error fetching userDetails: $error");
      rethrow; // Rethrow the error to let the caller handle it
    }
  }
}
