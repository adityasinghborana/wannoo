import 'package:get/get.dart';
import 'package:wannoo/categories/presentationlayer/categorycontroller.dart';
import 'package:wannoo/routes.dart';
import 'package:wannoo/search/datalayer/model/request/city_request.dart';
import 'package:wannoo/search/datalayer/model/request/countryrequest.dart';
import 'package:wannoo/search/datalayer/model/response/city_response.dart';
import 'package:wannoo/search/datalayer/model/response/continentsreponse.dart';
import 'package:wannoo/search/datalayer/model/response/country_response.dart';
import 'package:wannoo/search/datalayer/usecase/Getcitiesusecase.dart';
import 'package:wannoo/search/datalayer/usecase/continentusecase.dart';
import 'package:wannoo/search/datalayer/usecase/getcountryusecase.dart';
import 'package:wannoo/utilities/dialog.dart';

class SearchPageController extends GetxController {
  @override
  void onInit() {
    super.onInit();

    getContinents();
    Category();
  }

  final GetAllContinentsUseCase getAllContinentsUseCase;
  final GetCountriesUseCase getCountriesUseCase;
  final GetCitiesUsecase getCitiesUsecase;
  final CategoryController categoryController = Get.find();

  SearchPageController(
      {required this.getAllContinentsUseCase,
      required this.getCountriesUseCase,
      required this.getCitiesUsecase});

  RxList<String> continentList = <String>["1", "2", "3"].obs;
  RxList<String> countryList = <String>["1", "2", "3", "4"].obs;
  RxList<String> cityList = <String>["1", "7", "3"].obs;
  RxList<String> categoryList = <String>["2", "1", "23"].obs;

  RxString SelectedContinent = "".obs;
  RxString SelectedCountry = "".obs;
  RxString SelectedCity = "".obs;
  RxString SelectedCategory = "".obs;

  void Category() {
    categoryList.value =
        categoryController.category.map((e) => e.title).toList();
  }

  Future<void> getContinents() async {
    try {
      final List<AllContinents> continents =
          await getAllContinentsUseCase.execute();
      continentList.value = continents.map((e) => e.name).toList();
    } catch (error) {
      // Handle the error by displaying a SnackBar only if the context is available
      if (Get.context != null) {
        showToast(
            state: StateType.Error,
            message: "Error fetching continents: $error");
      } else {
        print("Error fetching continents: $error");
      }
    }
  }

  Future<void> getCountries(CountriesRequest data) async {
    countryList.clear();
    cityList.clear(); // Reset city list on new country selection
    try {
      print("Fetching countries for continent: ${data.name}");
      final List<CountryResponse> countries =
          await getCountriesUseCase.execute(data);
      countryList.value = countries.map((e) => e.name ?? "No Name").toList();
      print("Countries fetched: ${countryList.toList()}");
    } catch (error) {
      if (Get.context != null) {
        showToast(
            state: StateType.Error,
            message: "Error fetching countries: $error");
      } else {
        print("Error fetching countries: $error");
      }
    }
  }

  Future<void> getCities(CityRequest data) async {
    cityList.clear();

    try {
      print("Fetching cities for country: ${data.countryName}");
      final List<CityResponse> cities =
          await getCitiesUsecase.execute(data.countryName ?? "");
      cityList.value = cities.map((e) => e.CityName ?? "No Name").toList();
      print("Cities fetched: ${cityList.toList()}");
    } catch (error) {
      if (Get.context != null) {
        showToast(
            state: StateType.Error, message: "Error fetching cities: $error");
      } else {
        print("Error fetching cities: $error");
      }
    }
  }

  void moveTo() {
    Get.toNamed(AppRoutes.searchresult, parameters: {
      'continent': "$SelectedContinent",
      'country': "$SelectedCountry",
      'city': "$SelectedCity",
      'category': "$SelectedCategory",
    });
  }
}
