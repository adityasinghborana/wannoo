import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:wannoo/profile/datalayer/repo/legal_repo.dart';
import 'package:wannoo/profile/datalayer/services/legal_remote.dart';
import 'package:wannoo/profile/datalayer/usecase/legalscreen_usecase.dart';

class LegalScreenController extends GetxController {
  @override
  void onInit() {
    getData();
    super.onInit();
  }

  final LegalScreenUseCase legalScreenUseCase =
      LegalScreenUseCase(LegalRepoImpl(LegalRemote(Dio())));
  var content = "".obs;

  void getData() async {
    await legalScreenUseCase.execute().then((res) {
      if (res.result != null) {
        content.value = res.result?.content ?? "";
      }
    });
  }
}
