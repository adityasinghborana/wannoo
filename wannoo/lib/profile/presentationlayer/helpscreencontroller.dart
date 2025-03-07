import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wannoo/Constants.dart';
import 'package:wannoo/profile/datalayer/model/request/form_request.dart';
import 'package:wannoo/profile/datalayer/repo/contact_us_repo.dart';
import 'package:wannoo/profile/datalayer/services/remote.dart';
import 'package:wannoo/profile/datalayer/usecase/contact_us_usecase.dart';

import '../datalayer/usecase/send_form_usecase.dart';

class HelpScreenController extends GetxController {
  final RxString email = "".obs;
  final RxString mobile = "".obs;
  final RxString address = "".obs;
  final TextEditingController name = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController message = TextEditingController();

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  final GetContactUsUsecase getContactUsUsecase =
      GetContactUsUsecase(ContactUsRepoImpl(ContactUsRemote(Dio())));

  final SendFormUseCase sendFormUseCase =
      SendFormUseCase(ContactUsRepoImpl(ContactUsRemote(Dio())));

  Future<void> getData() async {
    try {
      await getContactUsUsecase.execute().then((res) {
        email.value = res.Email ?? "";
        mobile.value = res.mobilenumber ?? "";
        address.value = res.Address ?? "";
      });
    } catch (e) {
      print(e);
    }
  }

  void sendData() async {
    try {
      await sendFormUseCase
          .execute(FormRequest(
              name: name.text,
              email: emailController.text,
              message: message.text))
          .then((res) {
        if (res.result!.id != null) {
          openIconSnackBar(
              Get.context,
              "Form Submitted Successfully",
              Icon(
                Icons.check_circle_outline,
                color: themeColor.colorBgPrimary,
              ));
        }
      });
    } catch (e) {
      print(e);
    }
  }
}

openIconSnackBar(
  context,
  String text,
  Widget icon,
) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: Colors.green,
    content: Container(
      child: Row(
        children: [
          icon,
          SizedBox(
            width: 5,
          ),
          Text(text)
        ],
      ),
    ),
    duration: const Duration(milliseconds: 2500),
  ));
}
