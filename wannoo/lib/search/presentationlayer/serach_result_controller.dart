import 'package:get/get.dart';

import '../../homepage/datalayer/model/experiences_model.dart';
import '../../homepage/presentationlayer/homepage_controller.dart';

class SearchResultController extends GetxController {
  @override
  void onInit() {
    final String? continent = Get.parameters['continent'];
    final String? country = Get.parameters['country'];
    final String? city = Get.parameters['city'];
    final String? category = Get.parameters['category'];
    getFilteredExperiences(continent!, country!, city!, category!);
    super.onInit();
  }

  final RxList<ExperiencesModel> searchedPlaces = <ExperiencesModel>[].obs;
  void getFilteredExperiences(
    String SelectedContinent,
    String SelectedCountry,
    String SelectedCity,
    String SelectedCategory,
  ) {
    print(SelectedCity);
    final HomePageController homePageController = Get.find();
    // Apply filtering based on multiple fields
    List<ExperiencesModel> filteredList =
        homePageController.experiences.where((experience) {
      print("City ${experience.location.toLowerCase().trim()}");
      print("City ${SelectedCategory.trim().toLowerCase()}");
      return (experience.continent?.toLowerCase() ==
              SelectedContinent.toLowerCase()) &&
          (experience.country!.toLowerCase() ==
              SelectedCountry.toLowerCase()) &&
          (experience.location.toLowerCase().trim() ==
              SelectedCity.toLowerCase().trim()) &&
          (experience.category.trim().toLowerCase() ==
              SelectedCategory.trim().toLowerCase());
    }).toList();
    print(homePageController.experiences);
    print(searchedPlaces.toList());
    searchedPlaces.assignAll(filteredList);
    print("Filtered list: $filteredList");
  }
}
