import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:wannoo/category_places/presentation_layer/filters_controller.dart';
import 'package:wannoo/homepage/data_layer/model/experiences_model.dart';
import 'package:wannoo/homepage/presentation_layer/homepage_controller.dart';

import '../../search/data_layer/repository/repository.dart';
import '../../search/data_layer/service/continent_remote.dart';
import '../../search/data_layer/usecase/continent_usecase.dart';
import '../../search/data_layer/usecase/get_cities_usecase.dart';
import '../../search/data_layer/usecase/get_country_usecase.dart';

class CategoryPlacesController extends GetxController {
  @override
  void onInit() {
    getlist();
    super.onInit();
  }

  final FiltersController filtersController = Get.put(FiltersController(
      getCountriesUseCase: GetCountriesUseCase(
        ContinentRepoImpl(
          ContinentRemote(Dio()),
        ),
      ),
      getCitiesUsecase: GetCitiesUsecase(
        ContinentRepoImpl(
          ContinentRemote(Dio()),
        ),
      ),
      getAllContinentsUseCase:
          GetAllContinentsUseCase(ContinentRepoImpl(ContinentRemote(Dio())))));
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

  void getFilteredList() {
    final city = filtersController.selectedCity.trim().toLowerCase();
    final country = filtersController.selectedCountry.trim().toLowerCase();
    final continent = filtersController.selectedContinent.trim().toLowerCase();
    final category = filtersController.selectedCategory.trim().toLowerCase();

    final List<ExperiencesModel> list =
        homePageController.experiences.where((item) {
      final itemCity = item.location.toLowerCase();
      final itemCountry = item.country?.toLowerCase();
      final itemContinent = item.continent?.toLowerCase();
      final itemCategory = item.category.toLowerCase();

      // Only apply a filter if the selected value is not empty
      final matchesCity = city.isEmpty || itemCity == city;
      final matchesCountry = country.isEmpty || itemCountry == country;
      final matchesContinent = continent.isEmpty || itemContinent == continent;
      final matchesCategory = category.isEmpty || itemCategory == category;

      return matchesCity &&
          matchesCountry &&
          matchesContinent &&
          matchesCategory;
    }).toList();

    places.assignAll(list);
  }
}
