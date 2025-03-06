import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:wannoo/profile/datalayer/repo/contact_us_repo.dart';
import 'package:wannoo/profile/datalayer/services/remote.dart';
import 'package:wannoo/profile/datalayer/usecase/contact_us_usecase.dart';

class HelpScreenController extends GetxController{
  final GetContactUsUsecase getContactUsUsecase = GetContactUsUsecase(ContactUsRepoImpl(ContactUsRemote(Dio())));

  Future<void> getData() async{
    await getContactUsUsecase.execute().then((res){
      print(res);
    });
  }
}