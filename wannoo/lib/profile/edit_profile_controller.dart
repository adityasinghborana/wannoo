import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:wannoo/AuthModule/datalayer/model/request/update_user_model.dart';
import 'package:wannoo/AuthModule/datalayer/repo/update_user_repo.dart';
import 'package:wannoo/AuthModule/datalayer/services/update_user_remote.dart';
import 'package:wannoo/AuthModule/datalayer/usecase/update_user_usecase.dart';
import 'package:wannoo/utilities/auth_class.dart';

class EditProfileController extends GetxController {
  final UpdateUserUseCase updateUserUseCase =
      UpdateUserUseCase(UpdateUserRepoImpl(UpdateUserRemote(Dio())));
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  Future<void> updateUserDetail() async {
    var uid = await getUserUID();
    try {
      await updateUserUseCase
          .execute(UpdateUserModel(
        uid: uid,
        username: nameController.text,
        address: addressController.text,
      ))
          .then((res) {
        print(res.toJson());
      });
    } catch (e) {
      print(e);
    }
  }
}
