import 'package:get/get.dart';
import 'package:wannoo/homepage/data_layer/model/experiences_model.dart';
import 'package:wannoo/homepage/presentation_layer/homepage_controller.dart';

class CategoryPlacesController extends GetxController {
  @override
  void onInit() {
    getlist();
    super.onInit();
  }

  final HomePageController homePageController = Get.find();
  final String? category = Get.parameters["category"];

  final RxList<ExperiencesModel> places = <ExperiencesModel>[].obs;

  void getlist() {
    final List<ExperiencesModel> list =
        homePageController.experiences.where((item) {
      return item.category == category;
    }).toList();
    places.assignAll(list);
  }
}
