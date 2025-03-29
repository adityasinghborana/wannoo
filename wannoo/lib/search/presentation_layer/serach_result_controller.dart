import 'package:get/get.dart';

import '../../homepage/data_layer/model/experiences_model.dart';
import '../../homepage/presentation_layer/homepage_controller.dart';

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
    String selectedContinent,
    String selectedCountry,
    String selectedCity,
    String selectedCategory,
  ) {
    final HomePageController homePageController = Get.find();
    // Apply filtering based on multiple fields
    List<ExperiencesModel> filteredList =
        homePageController.experiences.where((experience) {
      return (experience.continent?.toLowerCase() ==
              selectedContinent.toLowerCase()) &&
          (experience.country!.toLowerCase() ==
              selectedCountry.toLowerCase()) &&
          (experience.location.toLowerCase().trim() ==
              selectedCity.toLowerCase().trim()) &&
          (experience.category.trim().toLowerCase() ==
              selectedCategory.trim().toLowerCase());
    }).toList();
    searchedPlaces.assignAll(filteredList);
  }
}
