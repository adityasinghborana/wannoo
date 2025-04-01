import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wannoo/constants.dart';
import 'package:wannoo/search/data_layer/model/request/city_request.dart';
import 'package:wannoo/search/data_layer/repository/repository.dart';
import 'package:wannoo/search/data_layer/service/continent_remote.dart';
import 'package:wannoo/search/data_layer/usecase/get_cities_usecase.dart';
import 'package:wannoo/search/data_layer/usecase/continent_usecase.dart';
import 'package:wannoo/search/data_layer/usecase/get_country_usecase.dart';
import 'package:wannoo/search/presentation_layer/serach_controller.dart';
import 'package:wannoo/search/presentation_layer/widgets/drop_down.dart';
import 'package:wannoo/utilities/dialog.dart';
import '../data_layer/model/request/countryrequest.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SearchPageController searchPageController = Get.put(
        SearchPageController(
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
            getAllContinentsUseCase: GetAllContinentsUseCase(
                ContinentRepoImpl(ContinentRemote(Dio())))));
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search Places"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          ListTile(
            dense: true,
            title: const Text("Continent"),
            titleTextStyle: Theme.of(context).textTheme.titleSmall,
          ),
          ListTile(
            title: CustomDropDownRow(
              icon: const Icon(Icons.place),
              dropdownlist: searchPageController.continentList,
              onchanged: (value) {
                searchPageController.selectedContinent.value = value;
                searchPageController
                    .getCountries(CountriesRequest(name: value));
                // Call the API related to continent selection here
              },
            ),
          ),
          ListTile(
            dense: true,
            title: const Text("Country"),
            titleTextStyle: Theme.of(context).textTheme.titleSmall,
          ),
          ListTile(
            title: CustomDropDownRow(
              icon: const Icon(Icons.place),
              dropdownlist: searchPageController.countryList,
              onchanged: (value) {
                searchPageController.selectedCountry.value = value;
                searchPageController.getCities(CityRequest(countryName: value));
                // Call the API related to continent selection here
              },
            ),
          ),
          ListTile(
            dense: true,
            title: const Text("City"),
            titleTextStyle: Theme.of(context).textTheme.titleSmall,
          ),
          ListTile(
            title: CustomDropDownRow(
              icon: const Icon(Icons.place),
              dropdownlist: searchPageController.cityList,
              onchanged: (value) {
                searchPageController.selectedCity.value = value;
              },
            ),
          ),
          ListTile(
            dense: true,
            title: const Text("Category"),
            titleTextStyle: Theme.of(context).textTheme.titleSmall,
          ),
          ListTile(
            title: CustomDropDownRow(
              icon: const Icon(Icons.category),
              dropdownlist: searchPageController.categoryList,
              onchanged: (value) {
                searchPageController.selectedCategory.value = value;

                // Call the API related to continent selection here
              },
            ),
          ),
          const SizedBox(height: 16),
          ListTile(
            title: FilledButton(
              onPressed: () {
                if (searchPageController.selectedCountry.isEmpty ||
                    searchPageController.selectedContinent.isEmpty ||
                    searchPageController.selectedCity.isEmpty ||
                    searchPageController.selectedCategory.isEmpty) {
                  return showSnackBar(context, "Plaese Select all Option",
                      state: StateType.error);
                }
                searchPageController.moveto();
              },
              child: const Text('Search'),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomRow extends StatelessWidget {
  final String name;

  const CustomRow({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Initialize with a placeholder value

    return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        // Aligns items to the start of the row
        children: [
          Text(
            name,
            style: CustomTextStyles.fontMdMedium,
          ),

          // Add some spacing between the Text and DropdownButton
        ]);
  }
}

class CustomDropDownRow extends StatelessWidget {
  final RxList<String> dropdownlist;
  final Icon icon;

  final ValueChanged<String> onchanged;

  const CustomDropDownRow(
      {Key? key,
      required this.dropdownlist,
      required this.onchanged,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Initialize with a placeholder value

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          boxShadow: [globalShadow],
          color: ThemeColor.colorWhite,
          borderRadius: BorderRadius.circular(GlobalRadius.borderRadiusMedium)),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          // Aligns items to the start of the row
          children: [
            icon,
            const SizedBox(
              width: Height.heightSm,
            ),
            Expanded(
              child: CustomDropDown(
                list: dropdownlist,
                onChanged: (String selectedValue) {
                  onchanged(selectedValue); // Define custom behavior here
                },
              ),
            ),
            // Add some spacing between the Text and DropdownButton
          ]),
    );
  }
}
